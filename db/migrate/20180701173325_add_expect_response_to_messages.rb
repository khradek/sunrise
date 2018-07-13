class AddExpectResponseToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :expect_response, :string
  end
end
