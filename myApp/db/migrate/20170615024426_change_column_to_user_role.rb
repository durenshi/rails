class ChangeColumnToUserRole < ActiveRecord::Migration[5.1]
  def change
    # 修改字段的型态(type)
    change_column(:user_roles, :role_id, :integer)
  end
end
