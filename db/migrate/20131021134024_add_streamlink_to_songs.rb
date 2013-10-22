class AddStreamlinkToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :streamlink, :string
  end
end
