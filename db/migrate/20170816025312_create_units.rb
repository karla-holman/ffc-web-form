class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :house
      t.string :name
      t.date :lease_start
      t.date :lease_end
      t.decimal :rent

      t.timestamps null: false
    end

    add_attachment :units, :lease
  end
end
