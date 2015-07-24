class RemoveHiddenFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :hidden
  end
end
