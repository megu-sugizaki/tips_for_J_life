class CreateEventUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_users do |t|
      t.integer :user_id, foreign_key: true
      t.integer :event_id, foreign_key: true

      t.timestamps
    end
  end
end
