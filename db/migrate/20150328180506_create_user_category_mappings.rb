class CreateUserCategoryMappings < ActiveRecord::Migration
  def change
    create_table :user_category_mappings do |t|
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
