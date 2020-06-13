# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.references :role, references: :roles, foreign_key: true, index: true
      t.string  :type
      t.string  :name, null: false
      t.text    :description
      t.integer :total_transaction_sum, default: 0.0, null: false
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_column :users, :status, :merchant_status, default: 'active'
    add_index  :users, :status

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    ### Block to update Merchants relation with transactions
    remove_reference(:transactions, :merchant, foreign_key: true, index: true)
    add_reference(:transactions, :user, references: :users, foreign_key: true, index: true)
    remove_index :merchants, :status if index_exists?(:merchants, :status)
    drop_table   :merchants, force: :cascade, if_exists: true
  end

  def down
    create_table :merchants do |t|
      t.string  :name, null: false
      t.text    :description
      t.string  :email, null: false
      t.decimal :total_transaction_sum, default: 0.0, null: false

      t.timestamps
    end

    remove_index :users, :status
    remove_index :users, :email
    remove_index :users, :reset_password_token

    drop_table :users, force: :cascade, if_exists: true

    add_column :merchants, :status, :merchant_status, default: 'active'
    add_index  :merchants, :status
  end
end
