class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :conversation
  belongs_to :recurring_message, optional: true

  after_create :analyze_yes_no_response, if: :expecting_yes_no_response?
  after_create :analyze_1_thru_5_response, if: :expecting_1_thru_5_response?

  #Need to account for send_at time being set to past (sent at past time when actually just sent on messages page)
  #below not working because of work around in controller (adds 4 hours after save)

  #before_save :if_past

  #def if_past
  #  if self.send_at < 5.minutes.ago
  #    self.update :send_at => Time.now
  #  end
  #end
 

  def expecting_yes_no_response?
    self.direction == 'inbound' && self.expect_response == "Yes or No"
  end

  def analyze_yes_no_response
    answer = self.body.split.first.upcase
    matching_follow_up = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: self.reference_number) 
    #reply_answer_one = self.reply_answer_one
    if answer == "YES" #reply_answer_one
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.yes_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id
    elsif answer == "NO"
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.no_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id    
    else
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => 'Please answer either Yes or No', :status => 'pending', :direction => 'outbound-api', :expect_response => 'Yes or No', :reference_number => self.reference_number, :recurring_message_id => self.recurring_message_id  
    end
    SendSmsJob.set(wait_until: Time.now + 5.seconds).perform_later(message)  
  end


  def expecting_1_thru_5_response?
    self.direction == 'inbound' && self.expect_response == "1 thru 5"
  end

  def analyze_1_thru_5_response
    answer = self.body.split.first.to_i
    matching_follow_up = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: self.reference_number) 
    case 
    when answer == 1 
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.one_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id
    when answer == 2
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.two_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id
    when answer == 3
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.three_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id
    when answer == 4
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.four_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id
    when answer > 4 
      next_message = FollowUp.where(recurring_message_id: self.recurring_message_id).find_by(reference_number: matching_follow_up.five_message_ref)
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => next_message.body, :status => 'pending', :direction => 'outbound-api', :expect_response => next_message.expect_response, :reference_number => next_message.reference_number, :recurring_message_id => self.recurring_message_id
    else
      message = Message.create :user_id => self.user_id, :conversation_id => self.conversation_id, :to => self.from, :body => 'Please answer with a number 1 thru 5', :status => 'pending', :direction => 'outbound-api', :expect_response => '1 thru 5', :reference_number => self.reference_number, :recurring_message_id => self.recurring_message_id 
    end
      
    SendSmsJob.set(wait_until: Time.now + 5.seconds).perform_later(message)  
  end


  #Creates next instance of recurring message
  def self.create_next_message(user_id, recurring_message_id, conversation_id, to, body, send_at, frequency, expect_response, reference_number)
    message = Message.create :user_id => user_id, :recurring_message_id => recurring_message_id, :conversation_id => conversation_id, :to => to, :body => body, :send_at => send_at,  :frequency => frequency, :expect_response => expect_response, :status => 'pending', :direction => 'outbound-api', :recurring => true, :reference_number => reference_number
    
    if message.frequency == "Daily"   
      send_at = message.send_at + 1.day
    elsif message.frequency == "Every Other Day"
      send_at = message.send_at + 2.days  
    elsif message.frequency == "Weekly"
      send_at = message.send_at + 7.days    
    end

    message.update(send_at: send_at)
    #workaround for time zone, need to fix
    send_time = message.send_at.advance(:hours => 4)
    SendSmsJob.set(wait_until: send_time).perform_later(message)
  end


end
