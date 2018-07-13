class Conversation < ApplicationRecord
  belongs_to :patient
  belongs_to :user

  has_many :messages
  has_many :recurring_messages
end
