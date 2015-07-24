class InvitationsMailer < ApplicationMailer

  def invite_new_user(invitation, email)
    @invitation = invitation
    mail(to: email, subject: "You are invited to sign up at CodeCore.")
  end
end
