class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :text
      t.integer :lyric_id
      t.integer :user_id
      t.date :date_created
      t.timestamps
    end
  end

  def down
    drop_table
  end
end
