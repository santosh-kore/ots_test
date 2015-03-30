class CategoriesAlterSessionUrlType < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE categories
        ALTER COLUMN session_url varchar(255);
    SQL
  end
end
