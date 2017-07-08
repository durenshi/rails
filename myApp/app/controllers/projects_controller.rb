class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def_param_group :project do
    param :project_name, String
    param :project_type, String
    param :begin_at, Date
    param :end_at,Date
  end


  # GET /projects
  # GET /projects.json
  def index
    # @projects = Project.where( is_delete: 0).page(params[:page]).per(5)
    @projects = Project.page(params[:page]).per(5)

  end

  api :GET, '/projects/:id', '项目详情'
  param :id, :number
  example '[test]'
  # GET /projects/1
  # GET /projects/1.json
  def show
    @users = @project.users
  end

  api :POST, "/projects","新建项目"
  param_group :project
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  #   set_project函数中已经做了操作
  end

  def get_all_projects
    projects = Project.all
    render json:{data:projects}
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        # format.html { redirect_to @project, notice: '项目已经成功创建.' }
        format.html { redirect_to @project, notice: t(:notice) }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_path(@project), notice: '项目已经成功修改.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.is_delete = 1;
    @project.save
    @project.user_projects.destroy_all
    respond_to do |format|
      format.html { redirect_to projects_url, notice: '项目已经成功删除.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :project_type, :begin_at, :end_at, :is_delete)
    end
end
