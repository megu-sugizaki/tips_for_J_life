class CreateAssociationProblemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :association_problem_tags do |t|
      t.integer :problem_id
      t.integer :problem_tag_id

      t.timestamps
    end
  end
end
