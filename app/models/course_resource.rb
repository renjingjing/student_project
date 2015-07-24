class CourseResource < ActiveRecord::Base

  belongs_to :kind
  belongs_to :course_unit

  has_many :submissions

  has_many :scores, dependent: :destroy
  has_many :scored_users, through: :scores, source: :user

  validates :kind, presence: true
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :resource_file, ResourceFileUploader

  def authorize
    unless can? :manage, @course_resource
      redirect_to root_path, alert: "Access denied buddy!"
    end
  end


end
