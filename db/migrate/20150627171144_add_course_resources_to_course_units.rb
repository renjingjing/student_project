class AddCourseResourcesToCourseUnits < ActiveRecord::Migration
  def change
    add_reference :course_resources, :course_unit, index: :true, foreign_key: true
  end
end
