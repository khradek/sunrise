class AddRecurringToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :recurring, :boolean, null: false, default: false
    add_column :messages, :frequency, :string
  end
end
