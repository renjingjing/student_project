class AddHiddenColumnsToMaterial < ActiveRecord::Migration
  def change
    add_column :courses, :hidden, :boolean
    add_column :course_units, :hidden, :boolean
    add_column :course_resources, :hidden, :boolean
  end
end
