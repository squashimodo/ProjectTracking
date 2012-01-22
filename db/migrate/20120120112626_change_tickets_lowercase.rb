class ChangeTicketsLowercase < ActiveRecord::Migration
  def change
  	rename_table("Tickets", "ticketsx")
  	rename_table("ticketsx", "tickets")
  end
end
