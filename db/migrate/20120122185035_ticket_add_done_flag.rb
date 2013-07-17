class TicketAddDoneFlag < ActiveRecord::Migration
  def change
    add_column :tickets, :done, :bool, :default => false
    end
end
