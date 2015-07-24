class ContactController < ApplicationController

  def index
  end

  def create
    @name = params[:name]
    @email = params[:email]

    respond_to do |format|
    ContactMailer.contact_email(@name)
    format.html { redirect_to root_path }
    end

    @phone = params[:phone]

  end

end
