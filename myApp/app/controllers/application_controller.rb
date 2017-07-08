class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :set_locale
  before_action :require_login


  private

  def require_login

    # redirect_to login_path
    if session[:current_user_id] == nil
      # flash[:error] = "You must be logged in to access this section"
       redirect_to login_url
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # 集中修改 URL 动态生成规则
  def default_url_options
    { locale: I18n.locale }
  end

end
