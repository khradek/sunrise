class AddExpectResponseToRecurringMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :recurring_messages, :expect_response, :string
  end
end
