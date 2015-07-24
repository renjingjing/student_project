class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.boolean :teacher
      t.string :avatar
      t.string :city
      t.string :country
      t.text :bio

      t.timestamps null: false
    end
  end
end
