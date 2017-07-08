class UserMailer < ApplicationMailer
  default from: 'durenshi1992@163.com'

  def welcome_email(user)
    @user = user
    puts @user.user_name
    mail(to: @user.email, subject: 'welcome')
  end



end
