class CreateArchiveTags < ActiveRecord::Migration
  def change
    create_table :archive_tags do |t|
      t.integer :tag_id
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
