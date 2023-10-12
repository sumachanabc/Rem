# frozen_string_literal: true

class DeviseCreateCondoUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :condo_users do |t|
      ## Your existing columns
      t.integer :room_number,                 null: false
      t.string  :condo_user_last_name,        null: false
      t.string  :condo_user_first_name,       null: false
      t.string  :condo_user_last_name_kana,   null: false
      t.string  :condo_user_first_name_kana,  null: false
      t.string  :condo_user_address,          null: false
      t.string  :condo_user_phone_number,     null: false

      t.references :condo, null: false, foreign_key: true

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
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

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

    add_index :condo_users, :email,                unique: true
    add_index :condo_users, :reset_password_token, unique: true
    # add_index :condo_users, :confirmation_token,   unique: true
    # add_index :condo_users, :unlock_token,         unique: true
  end
end
