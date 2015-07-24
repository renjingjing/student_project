class Invitation < ActiveRecord::Base
  belongs_to :invitee, class_name: "User"
  belongs_to :inviter, class_name: "User"
  
  validates :inviter_id, presence: true
  belongs_to :course
  has_secure_token

  after_save :unique_token

  private

  def unique_token
    invitations = Invitation.where("token = ?", token)
    regenerate_token unless invitations.length == 1
    unique_token unless invitations.length == 1
  end

  def self.email_absent? email
    !Invitation.where(email: email).present?
  end
end
