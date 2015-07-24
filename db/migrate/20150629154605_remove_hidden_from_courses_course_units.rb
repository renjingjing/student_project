class RemoveHiddenFromCoursesCourseUnits < ActiveRecord::Migration
  def change
    remove_column :course_units, :hidden
  end
end
