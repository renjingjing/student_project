class CreatePasswordRequests < ActiveRecord::Migration
  def change
    create_table :password_requests do |t|
      t.string :email
      t.string :token

      t.timestamps null: false
    end
  end
end
