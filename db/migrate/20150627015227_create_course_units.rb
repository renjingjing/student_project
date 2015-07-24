class CreateCourseUnits < ActiveRecord::Migration
  def change
    create_table :course_units do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
