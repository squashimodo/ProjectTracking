class ProjektNull < ActiveRecord::Migration
  def change

  	change_column :projects, :name, :string, :null => false
  end
end
