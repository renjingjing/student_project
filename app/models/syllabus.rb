class Syllabus < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_unit

  validates :course_unit_id, uniqueness: {scope: :course_id}
end
