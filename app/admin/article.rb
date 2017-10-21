ActiveAdmin.register Article do

  index do
    selectable_column
    column :id
    column :title
    column :card_summary
    column :user_id
    column :created_at
    column :category_id
    actions
  end

  form do |f|
    f.inputs "Infos de base" do
      f.input :user_id
      f.input :title
      f.input :card_summary
      f.input :summary
      f.input :body
      f.input :created_at
      f.input :category_id
      f.input :photo_presentation, as: :formtastic_attachinary ### THERE #### https://stackoverflow.com/questions/44413120/how-to-add-attachinary-input-in-rails-active-admin
      f.input :second_photo, as: :formtastic_attachinary ### THERE ####
      f.input :caption
      f.input :caption2
    end
    actions
  end

permit_params :title, :category_id, :summary, :card_summary, :body, :photo_presentation, :second_photo, :user_id, :caption, :caption2
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
