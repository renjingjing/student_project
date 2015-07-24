class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_resource

  mount_uploader :file, ResourceFileUploader

end
