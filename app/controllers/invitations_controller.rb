class InvitationsController < ApplicationController
  # before_action authenticate_inviter!
  def new

  end

  def create
    @course = Course.find(params[:course_id])
    @emails = params[:applicants].split(", ")
    @new_user_emails = @emails.select { |email| User.email_absent?(email) && Invitation.email_absent?(email) }
    @new_user_emails.each do |new_user_email|
      @i = Invitation.create(inviter: current_user,  course:@course, active: true, email: new_user_email)
      @i.update(student: params[:student] == "true" ? true : false)
      InvitationsMailer.invite_new_user(@i, new_user_email).deliver_now
    end
    @emails.each do |user_email|
      # need to test this.  I think it should work (wrt creating associations)
      if User.where(email: user_email).empty?
        i = Invitation.create(email: user_email.strip, inviter: current_user,
                        course: @course)
        i.update(student: params[:student] == "true" ? true : false)
      else
        i = Invitation.create(invitee_id: User.find_by_email(user_email.strip).id,
                  inviter: current_user, course:@course, email: user_email.strip)
        if params[:student] == "true"
          i.update(student:true)
          Studying.create(user: i.invitee, course: i.course)
          i.course.course_resources.each {|cr| Score.create(course_resource: cr,
                                                              user:i.invitee)}
        else
          i.update(student:false)
          Teaching.create(user: i.invitee, course: i.course)
        end
      end
    end
  redirect_to @course, notice: "Users invited"
  end
end
