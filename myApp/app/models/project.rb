class Project < ApplicationRecord
  validates_presence_of :project_name , {  message: "项目名不能为空" }
  has_many :user_projects , dependent: :destroy
  has_many :users, through: :user_projects
  # scope :is_delete, -> { where(is_delete: 0) }
   default_scope { where(is_delete: 0) }

end
