class CreateUsers2 < ActiveRecord::Migration
  def change
  	drop_table("Users")
  	create_table :users do |t|
    	t.string "username", :limit => 25, :null => false
    	t.string "password", :limit => 255, :null => false
    	t.string "first_name", :limit => 25, :null => false 
      t.string "last_name", :limit => 25, :null => false
      t.timestamps
    end
  end
end
