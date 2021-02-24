class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.integer :question_number, null: false

      t.timestamps
    end
  end
end
