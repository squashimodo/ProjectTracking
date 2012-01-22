class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.string "name", :limit => 30, :null => false
    	t.string "details", :limit => 255, :default => "", :null => false
    	t.date "start_date"
    	t.date "end_date"
      t.timestamps
    end
  end
end
