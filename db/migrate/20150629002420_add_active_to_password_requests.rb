class AddActiveToPasswordRequests < ActiveRecord::Migration
  def change
    add_column :password_requests, :active, :boolean
  end
end
