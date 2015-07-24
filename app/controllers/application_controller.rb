class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def active_token?
    if params[:token]
      @invitation ||= Invitation.find_by_token params[:token][:token]
    else
      @invitation ||= Invitation.where(email:params[:user][:email]).order(:active).first
    end
    unless @invitation && @invitation.active == true
      redirect_to root_path, notice: "A valid signup link is required in order to
      create an account.  Please check your email or else contact us"
    end
  end

  def authenticate_user!
    redirect_to new_session_path, notice: "Please sign in" unless current_user.present?
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user
end
