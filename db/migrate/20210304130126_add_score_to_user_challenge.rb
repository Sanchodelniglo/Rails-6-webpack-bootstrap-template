class AddScoreToUserChallenge < ActiveRecord::Migration[6.1]
  def change
    add_column :user_challenges, :score, :integer, default: 0
  end
end
