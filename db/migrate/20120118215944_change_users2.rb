class ChangeUsers2 < ActiveRecord::Migration
  def change
  	add_column("Users", "role_id", :integer, :default => 0)
  end
end
