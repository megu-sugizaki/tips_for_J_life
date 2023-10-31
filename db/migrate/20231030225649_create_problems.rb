class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :caption, null: false

      t.timestamps
    end
  end
end
