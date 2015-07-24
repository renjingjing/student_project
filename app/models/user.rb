class User < ActiveRecord::Base

  validates :email, presence: :true, uniqueness: true,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password

  mount_uploader :avatar, ImageUploader

  has_many :password_requests, dependent: :destroy

  has_many :invitees, through: :sent_invites, source: :invitee
  has_many :sent_invites, class_name: "Invitation", foreign_key: :inviter_id,
                  dependent: :destroy
  has_many :inviters, through: :received_invites, source: :inviter
  has_many :received_invites, class_name: "Invitation", foreign_key: :invitee_id,
                  dependent: :destroy

  has_many :submissions, dependent: :destroy

  has_many :studyings, dependent: :destroy
  has_many :studied_courses, through: :studyings, source: :course

  has_many :teachings, dependent: :destroy
  has_many :taught_courses, through: :teachings, source: :course

  has_many :scores, dependent: :destroy
  has_many :scored_courses, through: :scores, source: :course_resource

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(" ")
  end

  def self.email_absent? email
    !User.where(email: email).present?
  end

  def admin?
    admin == true
  end

end
