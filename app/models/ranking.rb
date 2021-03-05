class Ranking
  attr_reader :challenge, :user, :user_challenges

  def initialize(challenge:, user:)
    @challenge = challenge
    @user = user
    @user_challenges = challenge.user_challenges
  end

  def winner
    official.first.user.pseudo
  end

  def winner_restaurant
    official.first.restaurant
  end

  def first_finisher?
    user_challenges.size == 1
  end

  def user_challenge
    user_challenges.first if first_finisher?
  end

  def waiting_for_others?
    (challenge.users - [user]).size < challenge.invitations.size
  end

  def official
    build_fake_winner if multiple_high_score?

    user_challenges.order('score DESC')
  end

  private

  def multiple_high_score?
    user_challenges[1..].any? { |uc| uc.score == user_challenges.first.score }
  end

  def find_multi_high_scorers
    user_challenges.select { |uc| uc.score == user_challenges.first.score }
  end

  def build_fake_winner
    multi_high_scorers = find_multi_high_scorers
    fake_winner = multi_high_scorers.sample
    fake_winner.score += 1
    fake_winner.save!
  end

end
