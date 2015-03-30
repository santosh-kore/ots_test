class CreateVideoClasses < ActiveRecord::Migration
  def change
    create_table :video_classes do |t|
      t.string :class_name, null: false

      t.timestamps
    end
  end
end
