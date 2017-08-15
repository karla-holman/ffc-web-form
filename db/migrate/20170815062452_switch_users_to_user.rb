class SwitchUsersToUser < ActiveRecord::Migration
  def change
    drop_table :admins
    drop_table :service_providers
  end
end
