class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, cc:"contact@lestoitures.fr", subject: 'Bienvenue sur les toitures.fr')
    # This will render a view in `app/views/user_mailer`!
  end

  def contact_user(user, client)
    @destinataire = user
    @client = client

    mail(to: @destinataire.email,
      subject: 'Vous avez une nouvelle demande'
      )
  end

  def contact_client(user, client)
    @destinataire = user
    @client = client

    mail(to: @client.email,
      subject: "Coordonnées de la société #{@destinataire.company}"
      )
  end
end
