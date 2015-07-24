class AddUserReferencesToPasswordRequests < ActiveRecord::Migration
  def change
    add_reference :password_requests, :user, index: true, foreign_key: true
  end
end
