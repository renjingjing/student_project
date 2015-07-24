class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :syllabus

      t.timestamps null: false
    end
  end
end
