class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :intro, :text
    add_column :pages, :icon, :string
  end
end
