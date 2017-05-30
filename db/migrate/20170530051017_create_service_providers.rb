class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.string :name
      t.timestamps null: false
    end

    add_reference :houses, :service_provider, index: true
  end
end
