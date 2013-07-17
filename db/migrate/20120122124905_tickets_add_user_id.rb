class TicketsAddUserId < ActiveRecord::Migration
  def change
    add_column :tickets, :user_id, :integer, :null => false
  end
end
