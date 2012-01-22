class ProjektNull < ActiveRecord::Migration
  def change
  	change_column("Projects", "name", :string, :null => false)
  end
end
