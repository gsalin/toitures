ActiveAdmin.register Project do

  index do
    selectable_column
    column :user_id
    column :title
    column :description
    column :cost
    column :address
    column :project_photos
    column :date
    actions
  end

  form do |f|
    f.inputs "Infos de base" do
      f.input :user_id
      f.input :title
      f.input :description
      f.input :cost
      f.input :address
      f.input :date
      f.input :project_photos, as: :formtastic_attachinary ### THERE ####
    end
    actions
  end

  permit_params :title, :user_id, :cost, :address, :project_photos, :date
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
