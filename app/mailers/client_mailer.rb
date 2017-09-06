class ClientMailer < ApplicationMailer

  def contact_user(user, client)
    @destinataire = user
    @client = client

    mail(to: @destinataire.email,
      subject: 'Vous avez une nouvelle demande sur lestoitures.fr'
      )
  end

  def contact_client(user, client)
    @destinataire = user
    @client = client

    mail(to: @client.email,
      subject: "Votre message à #{@destinataire.company} sur lestoitures.fr"
      )
  end
end
