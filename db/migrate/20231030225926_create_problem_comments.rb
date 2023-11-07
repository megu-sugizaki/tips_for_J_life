class CreateProblemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :problem_comments do |t|
      t.integer :problem_id
      t.integer :user_id
      t.text :comment, null: false

      t.timestamps
    end
  end
end
