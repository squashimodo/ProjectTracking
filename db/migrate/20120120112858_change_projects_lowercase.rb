class ChangeProjectsLowercase < ActiveRecord::Migration
  def change
  	rename_table("Projects", "projectsx")
  	rename_table("projectsx", "projects")
  end
end
