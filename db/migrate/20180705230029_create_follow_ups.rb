class CreateFollowUps < ActiveRecord::Migration[5.0]
  def change
    create_table :follow_ups do |t|
      t.string :expect_response
      t.string :yes_message_ref
      t.string :no_message_ref
      t.string :one_message_ref
      t.string :two_message_ref
      t.string :three_message_ref
      t.string :four_message_ref
      t.string :five_message_ref
      t.references :recurring_message, foreign_key: true

      t.timestamps
    end
  end
end
