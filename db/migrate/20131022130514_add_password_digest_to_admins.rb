class AddPasswordDigestToAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :password_hash
    add_column :admins, :password_digest, :string
  end
end
