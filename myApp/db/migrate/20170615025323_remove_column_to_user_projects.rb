class RemoveColumnToUserProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column(:user_projects , :rolename)
  end
end
