module Sendgrid
  class InvitationMailer
    include SendGrid
    include Rails.application.routes.url_helpers

    attr_reader :user, :challenge, :restaurant

    def initialize(user_challenge:)
      @user = user_challenge.user
      @challenge = user_challenge.challenge
      @restaurant = user_challenge.restaurant
    end

    def send_invitations
      status_codes = []
      invitations = Getters::Invitations.for(user: user, challenge: challenge)
      invitations.each do |invitation|
        response = send(build_mail(invitation))
        status_codes << response
      end
      status_codes
    end

    def send(mail)
      response = sendgrid_api.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      response.status_code
    end

    def build_mail(invitation)
      from = Email.new(email: 'invitation@luncher-quizz.fr')
      to = Email.new(email: invitation.email)
      subject = 'Invitation à jouer au Luncher-Quizz'
      content = Content.new(type: 'text/plain', value: mail_content)
      Mail.new(from, subject, to, content)
    end

    def sendgrid_api
      SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    end

    def mail_content
      <<-STRING
        #{user.full_name.capitalize} aka #{user.pseudo.capitalize} te défis au Luncher-Quizz.
        Si il gagne, vous irez déjeuner dans ce restaurant : #{restaurant.google_url}.
        Si vous acceptez son challenge, RDV a cette adresse : #{link_to_join_the_party} !
        Bon chance !
      STRING
    end

    def link_to_join_the_party
      challenge_user_challenges_url(challenge.id, Rails.application.routes.default_url_options)
    end
  end
end
