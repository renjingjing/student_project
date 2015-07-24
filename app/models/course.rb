class Course < ActiveRecord::Base

	mount_uploader :course_logo, ImageUploader

  belongs_to :user

	has_many :invitations, dependent: :destroy
	has_many :invitees, through: :invitations, source: :invitee
	has_many :teachings, dependent: :destroy
	has_many :teachers, through: :teachings, source: :user

	has_many :studyings, dependent: :destroy
	has_many :students, through: :studyings, source: :user

	has_many :course_units, dependent: :destroy
	has_many :course_resources, through: :course_units

	has_many :invitations, dependent: :destroy

	has_many :syllabuses, dependent: :destroy
	has_many :course_unit_syllabulized, through: :syllabuses, source: :course_unit

  def study_for(user)
    studyings.find_by_user_id(user)
  end

  def teach_for(user)
    teachings.find_by_user_id(user)
  end

end
