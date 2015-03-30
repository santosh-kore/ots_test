class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :video_class_id, null: false
      t.string :cat_name, null: false
      t.string :session_id, null: false
      t.text :session_url, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
