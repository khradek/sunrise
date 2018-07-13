class AddReferenceNumberToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :reference_number, :integer
  end
end
