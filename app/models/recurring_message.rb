class RecurringMessage < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_many :messages
  has_many :follow_ups, inverse_of: :recurring_message
  accepts_nested_attributes_for :follow_ups, reject_if: proc { |attributes| attributes['body'].blank? }

  before_save :add_one_day
  after_create :create_first_message

  after_destroy :delete_unsent_message

  #so last message is sent the day of... make sure doesn't add one day when end_date not updated during update
  def add_one_day
    self.end_date = self.end_date + 1.day
  end

  def create_first_message
    message = Message.create :user_id => self.user_id, :recurring_message_id => self.id, :conversation_id => self.conversation_id, :expect_response => self.expect_response, :to => self.to, :body => self.body, :send_at => self.start_date, :status => 'pending', :direction => 'outbound-api', :recurring => true, :frequency => self.frequency
    
    #creates FollowUp for first message
    if self.expect_response.present?
      message.update(reference_number: 10000)
      FollowUp.create :recurring_message_id => self.id, :expect_response => self.expect_response, :reference_number => 10000, :yes_message_ref => 1, :no_message_ref => 2, :one_message_ref => 3, :two_message_ref => 4, :three_message_ref => 5, :four_message_ref => 6, :five_message_ref => 7  
    end
        

    #workaround for time zone, need to fix
    send_time = message.send_at.advance(:hours => 4)
    SendSmsJob.set(wait_until: send_time).perform_later(message)
  end

  #deletes the next scheduled message when recurring message series is deleted
  def delete_unsent_message
    messages = self.messages
    messages.each do |m|
      unless m.sent_at.present?
        m.destroy 
      end
    end
  end


end
