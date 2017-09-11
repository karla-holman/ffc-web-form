class AddNotesToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :admin_notes, :text
    add_column :houses, :user_notes, :text
  end
end
