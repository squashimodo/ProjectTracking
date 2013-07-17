class UsersAddEmailNull < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :null => false
  end
end
