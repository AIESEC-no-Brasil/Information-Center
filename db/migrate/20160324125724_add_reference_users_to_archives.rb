class AddReferenceUsersToArchives < ActiveRecord::Migration
  def change

  	add_foreign_key :archives, :users
  
  end
end
