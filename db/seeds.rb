# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.destroy_all
Client.destroy_all
Category.destroy_all

puts 'Creating categories...'
energie = Category.create!(name: 'Energie')
environnement = Category.create!(name: 'Environnement')
style = Category.create!(name: 'Style')
technique = Category.create!(name: 'Technique')
patrimoine = Category.create!(name: 'Patrimoine')

puts 'Creating fake users...'
5.times do
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
  )
  user.save!
end

5.times do
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
end

user = User.new(
  email:   "gsalin@gmail.com",
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

user = User.new(
  email:   "thierry@lthf.fr",
  address: "Paris, France",
  city: "Paris",
  zip_code: "75001",
  first_name: "Thierry",
  last_name: "Girot",
  position: "Directeur général",
  office_phone: "01 45 37 45 18",
  mobile_phone: "06 63 22 36 89",
  latitude: 48.856614,
  longitude: 2.3522219,
  radius: 50,
  company: "Les toitures historiques de France",
  password: "azerty",
  description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
  construction:          true,
  renovation:            true,
  entretien:             true,
  maison:                true,
  chateau:               true,
  immeuble:              false,
  monument_historique:   true,
  charpente:             true,
  couverture:            true,
  ouverture:             true,
  terrasse:              true,
  plomberie:             true,
  )
user.save!

puts 'Finished!'
