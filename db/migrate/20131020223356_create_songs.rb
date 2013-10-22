class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.string :name
      t.date :release_date
      t.string :album
      t.timestamps
    end
  end

  def down
    drop_table
  end
end
