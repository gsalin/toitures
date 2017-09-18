ActiveAdmin.register User do
  index do
    selectable_column
    column :id
    column :email
    column :company
    column :first_name
    column :last_name
    column :position
    column :address
    column :created_at
    column :admin
    actions
  end

  form do |f|
    f.inputs "Coordonnées" do
      f.input :id
      f.input :email
      f.input :company
      f.input :address
      f.input :first_name
      f.input :last_name
      f.input :position
      f.input :mobile_phone
      f.input :office_phone
      f.input :created_at
      f.input :facebook
    end
    f.inputs "Spécialités" do
      f.input :description
      f.input :radius
      f.input :photo_company_logo
      f.input :photo_presentation
      f.input :construction
      f.input :renovation
      f.input :entretien
      f.input :charpente
      f.input :couverture
      f.input :ouverture
      f.input :terrasse
      f.input :plomberie
      f.input :maison
      f.input :chateau
      f.input :immeuble
      f.input :locaux_industriels
      f.input :mh
      f.input :qualibat
      f.input :rge
      f.input :ffb
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :company, :first_name, :last_name, :position, :mobile_phone, :office_phone, :email, :address, :description, :radius, :photo_company_logo, :photo_presentation, :construction, :renovation, :entretien, :charpente, :couverture, :ouverture, :terrasse, :plomberie, :maison, :chateau, :immeuble, :mh, :qualibat, :rge, :couvreur, :charpentier, :cv, :photo, :zip_code, :city, :locaux_industriels, :facebook, :ffb

end
