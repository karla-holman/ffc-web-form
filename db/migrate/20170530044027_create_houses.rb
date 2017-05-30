class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps null: false
    end
  end
end
