class PasswordsMailer < ApplicationMailer

  def password_request password_request
    @password_request = password_request
    mail(to: @password_request.email, subject:"A Password reset request was received")
  end
end
