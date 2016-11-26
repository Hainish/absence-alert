class AddMessageSeverity < ActiveRecord::Migration[5.0]
  def change
    create_table :message_categories do |t|
      t.string :title
      t.time :send_at
      t.integer :user_id
      t.integer :severity

      t.timestamps
    end
  end
end
