class CourseUnit < ActiveRecord::Base

   has_many :course_resources, dependent: :nullify
   belongs_to :course

   has_many :syllabuses
   has_many :syllabulized_courses, through: :syllabuses, source: :course

   def authorize
     unless can? :manage, @course_unit
       redirect_to root_path, alert: "Access denied buddy!"
     end
   end

end
