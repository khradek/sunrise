class AddBodyToFollowUps < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :body, :string
  end
end
