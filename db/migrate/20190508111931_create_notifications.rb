class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :category
      t.text :message
      t.timestamps
    end
  end
end
