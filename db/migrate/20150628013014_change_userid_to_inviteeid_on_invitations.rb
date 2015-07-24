class ChangeUseridToInviteeidOnInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :user_id
    add_column :invitations, :invitee_id, :integer
  end
end
