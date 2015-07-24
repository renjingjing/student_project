class Kind < ActiveRecord::Base

  has_many :course_resources, dependent: :destroy
end
