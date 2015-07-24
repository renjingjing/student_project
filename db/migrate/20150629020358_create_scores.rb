class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.boolean :complete
      t.references :user, index: true, foreign_key: true
      t.references :course_resource, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
