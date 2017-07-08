class User < ApplicationRecord

  validates_presence_of :user_name , {  message: "用户名不能为空" }

  has_many :user_projects , dependent: :destroy
  has_many :projects, through: :user_projects
  accepts_nested_attributes_for :user_projects

  has_many :user_groups , dependent: :destroy
  has_many :groups, through: :user_groups
  accepts_nested_attributes_for :user_groups

  has_many :user_roles , dependent: :destroy
  accepts_nested_attributes_for :user_roles

  self.per_page = 8

end
