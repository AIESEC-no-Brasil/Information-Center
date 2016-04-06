class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :name
      t.integer :xp_committee_id 
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
