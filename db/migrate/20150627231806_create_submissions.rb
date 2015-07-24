class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course_resource, index: true, foreign_key: true
      t.text :body
      t.string :file

      t.timestamps null: false
    end
  end
end
