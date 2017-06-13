module ApplicationHelper



  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end






  def resource_name_worker
    :worker
  end

  def resource_worker
    @resource ||= Worker.new
  end

  def devise_mapping_worker
    @devise_mapping ||= Devise.mappings[:worker]
  end
end
