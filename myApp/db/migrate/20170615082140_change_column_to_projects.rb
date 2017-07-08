class ChangeColumnToProjects < ActiveRecord::Migration[5.1]
  def change
    change_column(:projects, :project_begin, :date)
    change_column(:projects, :project_end, :date)

    rename_column(:projects, :project_begin, :begin_at)
    rename_column(:projects, :project_end, :end_at)
  end
end
