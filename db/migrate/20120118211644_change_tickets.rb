class ChangeTickets < ActiveRecord::Migration
  def change
  	add_column("Tickets", "project_id", :integer)
  	change_column("Tickets", "project_id", :integer, :null=>false)
  end
end
