class ChangeTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :project_id, :integer
    add_index :tickets, :project_id
  end
end
