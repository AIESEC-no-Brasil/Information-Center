class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo_url
      t.string :postion
      t.integer :xp_committee_id 
      t.timestamps null: false
    end
  end
end
