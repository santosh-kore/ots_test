class AddForeignKeyConstraintsToUserCatMappingTable < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE user_category_mappings
        ADD CONSTRAINT category_id_fk
          FOREIGN KEY (category_id) REFERENCES categories(id);
    SQL
    execute <<-SQL
      ALTER TABLE user_category_mappings
        ADD CONSTRAINT user_id_fk
          FOREIGN KEY (user_id) REFERENCES users(id);
    SQL
  end
end
