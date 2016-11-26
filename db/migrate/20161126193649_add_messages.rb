class AddMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content, :limit => 1000000000
      t.integer :message_category_id
      t.integer :message_severity_id

      t.timestamps
    end
  end
end
