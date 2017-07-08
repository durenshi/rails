class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create ]

  def new
  end

  def create
    @user = User.find_by(user_name: params[:session][:user_name].downcase , active:1)
    if @user
      session[:current_user_id] = @user.user_name
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end

end
