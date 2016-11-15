class UserMailer < ApplicationMailer
  default from: "luna.kang.ca@gmail.com"

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Thank you for joining Blocipedia!")
  end
end
