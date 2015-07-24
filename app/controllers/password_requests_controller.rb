class PasswordRequestsController < ApplicationController

  def new
    @password_request = PasswordRequest.new
  end

  def create
    @user = User.find_by_email params[:email]
    @password_request = @user.password_requests.create email:@user.email
    PasswordsMailer.password_request(@password_request).deliver_now
    redirect_to root_path, notice: "Password reset has been requested.  It should arrive shortly"
  end

  def reset
    @password_request = PasswordRequest.find_by_token(params[:token][:token])
    @user = User.find_by_email(@password_request.email)
    @new_pass = rand(999999999).to_s
    @user.update(password:@new_pass, password_confirmation:@new_pass)
  end

end
