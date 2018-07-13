class ChangeMessageReferencesToIntegerInFollowUps < ActiveRecord::Migration[5.0]
  def change
    change_column :follow_ups, :yes_message_ref, :integer
    change_column :follow_ups, :no_message_ref, :integer
    change_column :follow_ups, :one_message_ref, :integer
    change_column :follow_ups, :two_message_ref, :integer
    change_column :follow_ups, :three_message_ref, :integer
    change_column :follow_ups, :four_message_ref, :integer
    change_column :follow_ups, :five_message_ref, :integer

    add_column :follow_ups, :reference_number, :integer
  end
end
