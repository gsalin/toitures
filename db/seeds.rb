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
Worker.destroy_all

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
      photo_company_logo: File.new("app/assets/images/logo.png")
    )

    user.save!
    user.photo_presentation_url = ouvrierstoitnuit



puts 'Creating fake users...'
4.times do
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
    photo_company_logo: File.new("app/assets/images/logo.png")
  )
  user.save!
  user.photo_presentation_url = toit
end

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
    photo_company_logo: File.new("app/assets/images/logo.png")
  )
  user.save!
  user.photo_presentation_url = toitindustriel
end



puts 'Creating fake workers...'
5.times do
  worker = Worker.new(
    email: Faker::Internet.email,
    address: "Paris, France",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    charpentier: false,
    couvreur: true,
    looking_for_job: true,
    password: "azerty",
    cv: File.new("app/assets/images/testpdf.pdf")
  )
  worker.save!
  worker.photo_url = url
end

4.times do
  worker = Worker.new(
    email: Faker::Internet.email,
    address: "Paris, France",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    charpentier: true,
    couvreur: false,
    looking_for_job: true,
    password: "azerty",
    cv: File.new("app/assets/images/testpdf.pdf")
  )
  worker.save!
  worker.photo_url = ouvrierportrait
end

5.times do
  worker = Worker.new(
    email: Faker::Internet.email,
    address: "Paris, France",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    charpentier: true,
    couvreur: false,
    looking_for_job: true,
    password: "azerty",
    cv: File.new("app/assets/images/testpdf.pdf")
  )
  worker.save!
  worker.photo_url = workingman1
end

worker = Worker.new(
  email: "azerty@gmail.com",
  address: "Paris, France",
  first_name: "charpentier",
  last_name: "Salin",
  phone_number: "0663983171",
  charpentier: true,
  couvreur: false,
  looking_for_job: true,
  password: "azerty",
  cv: File.new("app/assets/images/testpdf.pdf")
)
worker.save!
worker.photo_url = url



puts 'Finished!'
