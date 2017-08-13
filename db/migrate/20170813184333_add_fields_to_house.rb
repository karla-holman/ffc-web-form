class AddFieldsToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :name, :string
    add_attachment :houses, :image
    rename_column :attachments, :page_id, :attachable_id
    add_column :attachments, :attachable_type, :string
  end
end
