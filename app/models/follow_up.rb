class FollowUp < ApplicationRecord
  belongs_to :recurring_message, inverse_of: :follow_ups
end
