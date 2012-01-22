class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
    	t.string "name", :limit => 25, :null => false
    end
  end
end
