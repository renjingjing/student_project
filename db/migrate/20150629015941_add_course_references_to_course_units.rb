class AddCourseReferencesToCourseUnits < ActiveRecord::Migration
  def change
    add_reference :course_units, :course, index: true, foreign_key: true
  end
end
