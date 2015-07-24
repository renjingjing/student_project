class AddTokenAndInviterToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :token, :string
    add_column :invitations, :inviter_id, :integer
    add_index :invitations, :token
    add_index :invitations, :inviter_id
  end
end
