class AddReferencesToArchiveTags < ActiveRecord::Migration
  def change
  
  		add_foreign_key :archive_tags, :archives
  		add_foreign_key :archive_tags, :tags
  end
end
