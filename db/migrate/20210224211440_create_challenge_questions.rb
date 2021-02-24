class CreateChallengeQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :challenge_questions do |t|
      t.references :challenge, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
