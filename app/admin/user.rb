ActiveAdmin.register User do
  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :company
    column :email
    column :city
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
      f.input :zip_code
      f.input :city
      f.input :first_name
      f.input :last_name
      f.input :position
      f.input :mobile_phone
      f.input :office_phone
      f.input :created_at
    end
    f.inputs "Entreprise" do
      f.input :description
      f.input :radius
      f.input :photo_company_logo, as: :formtastic_attachinary
      f.input :photo_presentation, as: :formtastic_attachinary
    end
    f.inputs "Communication" do
      f.input :website
      f.input :facebook
      f.input :twitter
      f.input :linkedin
      f.input :press_link_1
      f.input :press_link_title_1
      f.input :press_link_2
      f.input :press_link_title_2
      f.input :press_link_3
      f.input :press_link_title_3
    end
    f.inputs "Métier" do
      f.input :construction
      f.input :renovation
      f.input :entretien
      f.input :charpente
      f.input :couverture
      f.input :ouverture
      f.input :terrasse
      f.input :plomberie
      f.input :architecte
      f.input :isolation
      f.input :specialite1
      f.input :specialite2
      f.input :specialite3
    end
    f.inputs "Type de batiments" do
      f.input :maison
      f.input :chateau
      f.input :immeuble
      f.input :locaux_industriels
      f.input :batiment_agricole
    end
    f.inputs "Labels" do
      f.input :ffb
      f.input :capeb
      f.input :rge
      f.input :rge_eco_artisan
      f.input :qualibat
      f.input :mh
      f.input :epv
      f.input :mof
      f.input :artisan
      f.input :artisan_d_art
      f.input :maitre_artisan
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  controller do
    def user_params
      params.require(:user).permit(
        :company,
        :first_name,
        :last_name,
        :position,
        :mobile_phone,
        :office_phone,
        :email,
        :address,
        :description,
        :radius,
        :photo_company_logo,
        :photo_presentation,
        :construction,
        :renovation,
        :entretien,
        :charpente,
        :couverture,
        :ouverture,
        :terrasse,
        :plomberie,
        :architecte,
        :isolation,
        :specialite1,
        :specialite2,
        :specialite3,
        :maison,
        :chateau,
        :immeuble,
        :batiment_agricole,
        :mh,
        :qualibat,
        :rge,
        :couvreur,
        :charpentier,
        :cv,
        :photo,
        :zip_code,
        :city,
        :locaux_industriels,
        :facebook,
        :ffb,
        :epv,
        :rge_eco_artisan,
        :capeb,
        :mof,
        :artisan,
        :artisan_d_art,
        :maitre_artisan,
        :website,
        :twitter,
        :linkedin,
        :press_link_1,
        :press_link_title_1,
        :press_link_2,
        :press_link_title_2,
        :press_link_3,
        :press_link_title_3
      )
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

end
