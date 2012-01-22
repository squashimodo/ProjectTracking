class UsersAddEmail < ActiveRecord::Migration
  def change
  	add_column("users", "email", :string, :limit => 255)
  	#change_column("users", "email", :string, :limit => 255, :null => false)
  end
end
