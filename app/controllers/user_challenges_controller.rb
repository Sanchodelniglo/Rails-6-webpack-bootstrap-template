class UserChallengesController < ApplicationController
  before_action :authenticate_user!

  def update
    user_challenge = UserChallenge.find(params[:id])
    if user_challenge.update!(user_challenge_params)
      create_uc_invitations(user_challenge: user_challenge, invitations_params: invitations_params)
      destination = challenge_restaurants_path(params[:challenge_id])
    else
      flash[:alert] = "Un problème s'est produit, veuillez réessayer"
      destination = new_challenge_invitation_path(challenge_id, id: user_challenge)
    end

    redirect_to destination
  end

  private

  def user_challenge_params
    params.require(:user_challenge).permit(invitations: %i[email _destroy])
  end

  def invitations_params
    params[:user_challenge][:invitations_attributes].values
  end

  def create_uc_invitations(user_challenge:, invitations_params:)
    invitations_params.each do |invitation_params|
      invitation_params.delete(:_destroy)
      user_challenge.invitations << Invitation.create!(invitation_params.merge(user_challenge: user_challenge))
    end
  end
end