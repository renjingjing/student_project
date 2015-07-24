class CreateCourseResources < ActiveRecord::Migration
  def change
    create_table :course_resources do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
