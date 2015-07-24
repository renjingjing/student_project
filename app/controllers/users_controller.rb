class UsersController < ApplicationController

  before_action :active_token?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @invitation.update active:false
      Invitation.where(email: @user.email).each do |invite|
        if invite.student == true
          Studying.create(user:@user, course_id:invite.course_id)
          invite.course.course_resources.each {|cr| Score.create(course_resource: cr,
                                                              user:@user)}
        else
          Teaching.create(user:@user, course_id:invite.course_id)
        end
      end
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User created"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Account deleted"
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if !@user.authenticate(params[:user][:current_password])
      flash[:alert] = "You've entered the wrong password"
      render :edit
    elsif @user.update(user_params)
      PasswordRequest.where(email:@user.email).destroy_all
      @password_request.destroy if @password_request
      redirect_to edit_users_path, notice: "Information updated"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:body, :first_name, :last_name, :email,
                :teacher, :admin, :avatar, :password, :password_confirmation,
                :city, :country, :bio, :token, :studied_course_ids)
  end
end
