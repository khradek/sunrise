class AddRecurringMessageReferenceToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :recurring_message, foreign_key: true
  end
end
