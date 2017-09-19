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

  def kramdown(text)
    return sanitize Kramdown::Document.new(text).to_html
  end

  def link_to_blank(body, url_options = {}, html_options = {})
    link_to(body, url_options, html_options.merge(target: "_blank"))
  end

end
