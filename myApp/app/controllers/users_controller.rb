class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create, :is_exist ]

  def_param_group :project do
    param :project_id, Integer
    param :project_name, String
  end

  def_param_group :user do
    param :user, Hash do
      param :name,String
      param_group :project
    end
  end

  def index
    # @users = User.page(params[:page]).per(5)
    @users = User.paginate(page:params[:page])
  end

  def new
    @user = User.new
    3.times {
      @user.user_roles.build
    }

  end


  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.welcome_email(@user).deliver_later
      # ExampleJob.perform_later(1)
      if @user.email.present?
        JobTestJob.perform_later(@user)
      end
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    # 获取所有项目信息
    @projects = Project.where( is_delete: 0)

    # 获取用户所在项目以及相关角色
    if @user.user_projects.count > 0
      @project = @user.user_projects.first
    else
      @project = UserProject.take
    end

    # 获取所有组
    @groups = Group.all

    # 获取用户所在组
    @usergroups = @user.user_groups
  end

  api :POST, '/user/:id/update', '更细用户'
  param_group :user
  def update
    #更新前把用户关联角色 用户组关联删除
    UserProject.where( user_id: params[:id] ).destroy_all
    UserRole.where( user_id: params[:id] ).destroy_all
    UserGroup.where( user_id: params[:id] ).destroy_all

    if @user.update(user_params)
      redirect_to users_path ,notice: '用户信息已成功修改.'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user已经成功删除.' }
      format.json { head :no_content }
    end
  end

  def is_exist
    user = User.find_by(user_name: params["user_name"])
    if user
      render json:{data:"存在该用户",result:0}
    else
      render json:{result:1}
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_name, :active, :email,
                                   user_roles_attributes:[:role_id],
                                   user_groups_attributes:[:group_id],
                                   user_projects_attributes:[:project_id]
                                  )
    end




end
# user_params用法
# 4.2 guides  https://ruby-china.github.io/rails-guides/v4.1/
# 枚举实现角色enum
# accepts_nested_attributes_for 重构用户与角色的实现
# 用户列表分页 gem
# config所有文件作用
# activesupport::concern