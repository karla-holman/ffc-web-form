class AddDeviseToServiceProviders < ActiveRecord::Migration
  def change
    ## Database authenticatable
    add_column :service_providers, :email, :string, null: false, default: ""
    add_column :service_providers, :encrypted_password, :string, null: false, default: ""

    ## Recoverable
    add_column :service_providers, :reset_password_token, :string
    add_column :service_providers, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :service_providers, :remember_created_at, :datetime

    ## Trackable
    add_column :service_providers, :sign_in_count, :integer, default: 0, null: false
    add_column :service_providers, :current_sign_in_at, :datetime
    add_column :service_providers, :last_sign_in_at, :datetime
    add_column :service_providers, :current_sign_in_ip, :inet
    add_column :service_providers, :last_sign_in_ip, :inet

    ## Confirmable
    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

    ## Lockable
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at

    add_index :service_providers, :email,                unique: true
    add_index :service_providers, :reset_password_token, unique: true
  end
end
