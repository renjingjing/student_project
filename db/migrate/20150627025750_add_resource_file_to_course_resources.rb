class AddResourceFileToCourseResources < ActiveRecord::Migration
  def change
    add_column :course_resources, :resource_file, :string
  end
end
