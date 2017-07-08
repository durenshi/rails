class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_type
      t.string :project_begin
      t.string :project_end
      t.boolean :is_delete

      t.timestamps
    end
  end
end
