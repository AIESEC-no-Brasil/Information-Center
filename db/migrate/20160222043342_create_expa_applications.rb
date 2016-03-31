class CreateExpaApplications < ActiveRecord::Migration
  def change
    create_table :expa_applications do |t|
      t.column :xp_id, :integer
      t.column :xp_url, :string
      #t.column :matchability :string
      t.column :xp_status, :integer #enum
      t.column :xp_current_status, :integer #enum
      #t.column :xp_favourite, :string
      t.column :xp_permissions, :text
      t.column :xp_created_at, :timestamp
      t.column :xp_updated_at, :timestamp

      #new
      t.column :xp_opportunity_id, :integer #foreigner_key (expa_opportunity)
      t.column :xp_interviewed, :boolean, default: false #done
      t.column :xp_person_id, :integer #foreigner_key lazy (expa_people)


      t.timestamps null: false
    end
  end
end
