class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :access_token
      t.timestamps
    end
  end

  def down
    drop_table
  end
end
