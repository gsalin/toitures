# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = "http://static.pexels.com/photos/91227/pexels-photo-91227.jpeg"
toit = "https://static.pexels.com/photos/209266/pexels-photo-209266.jpeg"
tuiles = "https://static.pexels.com/photos/177632/pexels-photo-177632.jpeg"
herbe = "https://static.pexels.com/photos/314937/pexels-photo-314937.jpeg"
terrasse = "https://static.pexels.com/photos/36362/pexels-photo.jpg"
ouverture = "https://static.pexels.com/photos/323776/pexels-photo-323776.jpeg"
extension = "https://static.pexels.com/photos/221506/pexels-photo-221506.jpeg"
metal = "https://static.pexels.com/photos/399753/pexels-photo-399753.jpeg"
eglise = "https://static.pexels.com/photos/208249/pexels-photo-208249.jpeg"
chambretoit = "https://static.pexels.com/photos/271743/pexels-photo-271743.jpeg"
charpentepierre = "https://static.pexels.com/photos/2871/building-architecture-church-monastery.jpg"
charpentepierre2 = "https://static.pexels.com/photos/157391/pexels-photo-157391.jpeg"
charpentetoitbois = "https://static.pexels.com/photos/281737/pexels-photo-281737.jpeg"
jacuzziveranda = "https://static.pexels.com/photos/195938/pexels-photo-195938.jpeg"
terrassehiverbois = "https://static.pexels.com/photos/200569/pexels-photo-200569.jpeg"
salondete = "https://static.pexels.com/photos/197129/pexels-photo-197129.jpeg"
ouverturelucarne = "https://static.pexels.com/photos/289560/pexels-photo-289560.jpeg"
workingman1 = "https://static.pexels.com/photos/38600/construction-worker-concrete-hummer-vibrator-38600.jpeg"
ouvrierstoitnuit = "https://static.pexels.com/photos/38293/workers-construction-site-hardhats-38293.jpeg"
toitindustriel = "https://static.pexels.com/photos/221047/pexels-photo-221047.jpeg"
ouvrierportrait = "https://static.pexels.com/photos/92033/pexels-photo-92033.jpeg"
logo = "https://static.pexels.com/photos/430205/pexels-photo-430205.jpeg"

require 'faker'

User.destroy_all
Client.destroy_all
Category.destroy_all
# Article.destroy_all

puts 'Creating categories...'
energie = Category.create!(name: 'Energie')
environnement = Category.create!(name: 'Environnement')
style = Category.create!(name: 'Style')
technique = Category.create!(name: 'Technique')
patrimoine = Category.create!(name: 'Patrimoine')

puts 'Creating Administrator user'

user = User.new(
    email:    "ecastaignet@hotmail.com",
    address: "Paris, France",
    city: "Paris",
    zip_code: "75001",
    first_name: "Edouard",
    last_name: "Castaignet",
    position: "Rédacteur en chef",
    office_phone: Faker::PhoneNumber.phone_number,
    mobile_phone: Faker::PhoneNumber.phone_number,
    latitude: 48.856614,
    longitude: 2.3522219,
    radius: 50,
    company: "Toitures de France",
    description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
    password: "azerty",
    construction:          true,
    renovation:            true,
    entretien:             true,
    maison:                true,
    chateau:               true,
    immeuble:              true,
    monument_historique:   true,
    charpente:             true,
    couverture:            true,
    ouverture:             true,
    terrasse:              true,
    plomberie:             false,
    admin:                 true,
    status:                0,
    photo_company_logo: File.new("app/assets/images/logo.png")
  )

  user.save!
  user.photo_presentation_url = ouvrierstoitnuit

  user = User.new(
      email:    "gsalin@gmail.com",
      address: "Paris, France",
      city: "boulogne",
      zip_code: "92100",
      first_name: "Guillaume",
      last_name: "Salin",
      position: "Directeur",
      office_phone: Faker::PhoneNumber.phone_number,
      mobile_phone: Faker::PhoneNumber.phone_number,
      latitude: 48.856614,
      longitude: 2.3522219,
      radius: 50,
      company: "LesToitures",
      description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
      password: "azerty",
      construction:          true,
      renovation:            true,
      entretien:             true,
      maison:                true,
      chateau:               true,
      immeuble:              true,
      monument_historique:   true,
      charpente:             true,
      couverture:            true,
      ouverture:             true,
      terrasse:              true,
      plomberie:             false,
      admin:                 true,
      status:                0,
      photo_company_logo: File.new("app/assets/images/logo.png")
    )

    user.save!
    user.photo_presentation_url = ouvrierstoitnuit



puts 'Creating fake pros...'

3.times do
  user = User.new(
    email:    Faker::Internet.email,
    address: "Paris, France",
    city: "Paris",
    zip_code: "75001",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    position: Faker::Job.title,
    office_phone: Faker::PhoneNumber.phone_number,
    mobile_phone: Faker::PhoneNumber.phone_number,
    latitude: 48.856614,
    longitude: 2.3522219,
    radius: 50,
    company: Faker::Company.name,
    description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
    password: "azerty",
    construction:          false,
    renovation:            true,
    entretien:             true,
    maison:                true,
    chateau:               true,
    immeuble:              false,
    monument_historique:   true,
    charpente:             true,
    couverture:            false,
    ouverture:             true,
    terrasse:              true,
    plomberie:             true,
    status:                0,
    photo_company_logo: File.new("app/assets/images/immeuble.svg")
  )
  user.save!
  user.photo_presentation_url = toit
end

3.times do
  user = User.new(
    email:    Faker::Internet.email,
    address: "Bordeaux, France",
    city: "Bordeaux",
    zip_code: "33000",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    position: Faker::Job.title,
    office_phone: Faker::PhoneNumber.phone_number,
    mobile_phone: Faker::PhoneNumber.phone_number,
    latitude: 44.8404400,
    longitude: -0.5805000,
    radius: 50,
    company: Faker::Company.name,
    password: "azerty",
    description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
    construction:          true,
    renovation:            true,
    entretien:             true,
    maison:                true,
    chateau:               true,
    immeuble:              true,
    monument_historique:   true,
    charpente:             true,
    couverture:            true,
    ouverture:             true,
    terrasse:              true,
    plomberie:             true,
    status:                0,
  )
  user.save!
  user.photo_company_logo_url = logo
  user.photo_presentation_url = tuiles
end

2.times do
  user = User.new(
    email:    Faker::Internet.email,
    address: "Bordeaux, France",
    city: "Bordeaux",
    zip_code: "33000",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    position: Faker::Job.title,
    office_phone: Faker::PhoneNumber.phone_number,
    mobile_phone: Faker::PhoneNumber.phone_number,
    latitude: 44.8404400,
    longitude: -0.5805000,
    radius: 50,
    company: Faker::Company.name,
    password: "azerty",
    description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
    construction:          true,
    renovation:            true,
    entretien:             true,
    maison:                true,
    chateau:               true,
    immeuble:              true,
    monument_historique:   true,
    charpente:             true,
    couverture:            true,
    ouverture:             true,
    terrasse:              true,
    plomberie:             true,
    status:                0,
    photo_company_logo: File.new("app/assets/images/logo.png")
  )
  user.save!
  user.photo_presentation_url = toitindustriel
end

puts "creating fake workers..."
2.times do
  user = User.new(
    email:    Faker::Internet.email,
    address: "Bordeaux, France",
    city: "Bordeaux",
    zip_code: "33000",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mobile_phone: Faker::PhoneNumber.phone_number,
    latitude: 44.8404400,
    longitude: -0.5805000,
    password: "azerty",
    charpentier:           true,
    couvreur:              true,
    status:                1,
  )
  user.save!
  user.photo_url = ouvrierportrait
end

# puts 'Creating articles...'

# article = Article.new(
#     title: "Les burons de l’Aubrac et du Cantal",
#     card_summary: "Témoins de l'occupation paysanne des monts de l'Aubrac et du Cantal, les burons du Massif Central retrouvent une nouvelle vie grâce à l'essor du tourisme vert.",
#     summary: "Les burons sont de petites maisons en pierre au toit de lauze, édifiées à partir du milieu du XVIIIème siècle dans les monts du Cantal, du Cézallier et de l’Aubrac, où les bergers trouvaient refuge et fabriquaient le fromage pendant les estives. Emblèmes du patrimoine architectural et rural de leurs pays, les burons font l’objet de restaurations et retrouvent  de nouvelles activités économiques grâce au tourisme.",
#     photo_presentation: File.new("app/assets/images/article/buron.jpg")
#     second_photo: File.new("app/assets/images/article/buron.jpg"),
#     category: "patrimoine",
#     body: "Histoire
# Issu du vieux français « buiron » qui veut dire cabane, les premiers burons apparaissent vers 1760 pour remplacer les cabanes d’estives des pays du Cantal et de l’Aubrac, les tras (ce qui veut dire trou ou creu), construites sous terre et recouvertes de mottes de gazon. A la fin du XIXème, les burons sont devenus de solides constructions, parfois en partie enterrées, couvertes par toit de lauzes. Dans les années 1945, près d’un millier de buron étaient encore en activité. Le buron est habité par plusieurs buronniers dont les charges varient de la garde du cheptel à la confection des fromages, réservé au Cantalès, le patron-vacher du Buron. Ils furent progressivement abandonnés jusqu’aux débuts des années 2000 où les derniers buronniers arrêtèrent leur activité.

# La difficile sauvegarde des burons
# Parce que les burons sont isolés aux milieux des montagnes, que leur rénovation est complexe et coûteuse due à la difficulté de rénover un toit en pierres de lauze, la plupart des burons sont aujourd’hui tombés en ruine. La couverture en lauze, taillée dans des blocs de pierre de 40 kg, peut atteindre jusqu’à 250 kg au mètre carré et demande donc une charpente lourde. Le lauze demande également un entretien annuel car les lauzes, soumises aux climats rudes des montagnes, bougent légèrement et doivent donc être recalées correctement après chaque hiver.
# Encouragées par le soutien de particuliers et d’institutions, deux associations luttent désormais pour la sauvegarde des burons :
# l’association de sauvegarde des burons du Cantal http://www.burons-du-cantal.fr/
# L’association «Les Amis de Notre-Dame d’Aubrac »

# La nouvelle vie des burons
# Grâce à l’essor du tourisme vert sur les hauts plateaux du Massif Centra, une trentaine de burons ont repris une activité et ont été reconvertis en gîtes, refuges de randonneurs, restaurants ou en musée comme le buron de Belles-aigues qui retrace la vie des buronniers du Cantal.

# Certains ont même repris leur activité d’antan en produisant les différents fromages de la région : salers, cantal, tome fraiche, aligot.    Ils sont ouverts pendant la belle saison et vous proposeront de découvrir la traite des vaches et la création des fromages sans oublier leur dégustation.
# Le Buron d'Algour du col de Néronne chez Guy Chambon, Cantal
# Le Buron du Col de Legal chez Jean-Paul Ausset, Cantal
# Le Buron de Caméjane à Saint-Chély d’Aubrac, Aveyron, http://www.buron-en-aubrac.com/index.php

# Se restaurer

# EN LOZERE
# Buron de Born
# http://www.lozere-tourisme.com/restaurants/RESLAR048FS000SJ/detail/marchastel/buron-de-born#bloc-presentation)
# Le Buron du Bes
# http://www.lozere-tourisme.com/restaurants/RESLAR048FS000UP/detail/recoules-d-aubrac/buron-du-bes
# Le buron du Che
# http://www.lozere-tourisme.com/restaurants/RESLAR048FS000RP/detail/nasbinals/buron-du-che
# EN AVEYRON
# Le Buron de l’Aubrac
# https://www.restaurant-buron-aubrac.com/

# Dormir :
# Dormir dans un buron « Le Buron de Cap Combattut »

# Le buron de Camejane
# http://www.buron-en-aubrac.com/sistre.php
# ",

#   )
#   article.save!
# end

puts 'Finished!'
