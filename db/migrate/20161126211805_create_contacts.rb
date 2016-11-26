class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :confirmation_token, limit: 128
      t.boolean :confirmed, default: false
      t.boolean :rejected, default: false
      t.integer :user_id, null: false
    end

    add_index :contacts, :email
  end
end
