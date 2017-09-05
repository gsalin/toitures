class ClientMailer < ApplicationMailer

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
