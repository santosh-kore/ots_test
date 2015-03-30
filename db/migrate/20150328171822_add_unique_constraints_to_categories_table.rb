class AddUniqueConstraintsToCategoriesTable < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE categories
        ADD CONSTRAINT unique_cat_name
          UNIQUE (cat_name);
    SQL
    execute <<-SQL
      ALTER TABLE categories
        ADD CONSTRAINT unique_session_id
          UNIQUE (session_id);
    SQL
  end
end
