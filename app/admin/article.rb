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

permit_params :title, :category_id, :summary, :card_summary, :body, :photos, :user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
