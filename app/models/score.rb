class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_resource

  validates :user_id, uniqueness: {scope: :course_resource_id}
end
