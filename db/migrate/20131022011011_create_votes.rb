class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.integer :comment_id
      t.integer :user_id
      t.integer :value
      t.date :date_created
      t.timestamp
    end
  end

  def down
    drop_table
  end
end
