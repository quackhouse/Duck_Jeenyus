class CreateLyrics < ActiveRecord::Migration
  def up
    create_table :lyrics do |t|
      t.string :text
      t.integer :song_id
      t.timestamps
    end
  end

  def down
    drop_table
  end
end
