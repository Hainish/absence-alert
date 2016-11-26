class AddMessageSeverity < ActiveRecord::Migration[5.0]
  def change
    create_table :message_severities do |t|
      t.string :title
      t.time :send_at

      t.timestamps
    end
  end
end
