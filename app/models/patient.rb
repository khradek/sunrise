class Patient < ApplicationRecord

  belongs_to :user
  has_one :conversation

  after_create :create_conversation!

  def create_conversation!
    Conversation.find_or_create_by(patient: self, user: self.user)
  end
  
end
