class CreateProblemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :problem_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
