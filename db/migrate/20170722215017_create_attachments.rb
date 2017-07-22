class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
    	t.string :name
    	t.string :description
    	t.belongs_to :page, index: true
      t.timestamps null: false
    end

    add_attachment :attachments, :file_attachment
  end
end
