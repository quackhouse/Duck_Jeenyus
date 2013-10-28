class AddEmailPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string, unique: true
    add_column :users, :password_digest, :string
  end
end
