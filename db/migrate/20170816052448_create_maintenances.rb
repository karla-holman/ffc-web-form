class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.string :title
      t.string :category
      t.string :priority
      t.string :status
      t.text :description
      t.date :due_date
      t.references :house
      t.timestamps null: false
    end

    add_attachment :maintenances, :image
  end
end
