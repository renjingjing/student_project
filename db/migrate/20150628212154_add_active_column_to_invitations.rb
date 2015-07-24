class AddActiveColumnToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :active, :boolean
  end
end
