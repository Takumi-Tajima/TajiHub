# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :admins, :email, unique: true
  end
end
