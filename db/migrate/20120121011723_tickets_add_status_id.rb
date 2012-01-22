class TicketsAddStatusId < ActiveRecord::Migration
  def change
  	add_column("tickets", "status_id", :integer)
  	add_index("tickets", "status_id")
  end
  

end
