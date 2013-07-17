class TicketsDetailsNamechange < ActiveRecord::Migration
  def change
    rename_column :tickets, :details, :description
  end
end
