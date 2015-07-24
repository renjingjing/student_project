class AddCourseResourcesToKind < ActiveRecord::Migration
  def change
    add_reference :course_resources, :kind, index: true, foreign_key: true
  end
end
