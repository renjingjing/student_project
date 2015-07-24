class AddStudentBooleanToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :student, :boolean
  end
end
