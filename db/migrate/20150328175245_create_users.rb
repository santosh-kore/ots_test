class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 150, null: false
      t.string :email, limit: 100, null: false
      t.string :phone, limit: 25, null: false
      t.date :date_of_birth
      t.string :sex, limit: 10
      t.text :address
      t.string :city, limit: 50
      t.string :country, limit: 50
      t.string :specialization
      t.integer :role_id

      t.timestamps
    end
  end
end
