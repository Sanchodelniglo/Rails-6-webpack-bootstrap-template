module Sendgrid
  class InvitationMailer
    include SendGrid
    attr_reader :user, :challenge, :restaurant

    def initialize(user:, challenge:)
      @user = user
      @challenge = challenge
      @restaurant = Getters::Restaurant.for(user: user, challenge: challenge)
    end

    def send_invitations
      invitations = user.invitations
      invitations.each do |invitation|
        send(build_mail(invitation))
      end
    end

    def send(mail)
      response = sendgrid_api.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

    def build_mail(invitation)
      from = Email.new(email: 'invitation@luncher-quizz.com')
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
        #{user.full_name} aka #{user.pseudo} te défis au luncher quizz.
        Si il gagne, vous irez manger #{restaurant_link}.
        Si vous acceptez son challenge, todo: add link to app
      STRING
    end

    def restaurant_link
      "<a href='#{restaurant.google_url}'>ici</a>".html_safe
    end
  end
end
