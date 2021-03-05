class CreateUserChallengeQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_challenge_questions do |t|
      t.references :user_challenge, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
