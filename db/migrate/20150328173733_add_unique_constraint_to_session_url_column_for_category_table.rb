class AddUniqueConstraintToSessionUrlColumnForCategoryTable < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE categories
        ADD CONSTRAINT unique_session_url
          UNIQUE (session_url);
    SQL
  end
end
