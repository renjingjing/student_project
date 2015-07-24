class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.references :course, index: true, foreign_key: true
      t.references :course_unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
