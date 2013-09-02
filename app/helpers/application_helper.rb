#encoding: utf-8
module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def custom_format(time)
    if time >= Date.today
      "Сегодня"
    elsif (time >= Date.yesterday and time <= Date.today)
      "Вчера"
    else
      time.strftime("%d.%m.%y")
    end
  end

  #for search gem
  def filter_url
    if params[:controller] == "home" && params[:action] == "index"
      root_path
    elsif params[:controller] == "buys"
      if params[:action] == "show_category"
        buys_category_path(params[:id].to_i)
      elsif params[:action] == "show_subcategory"
        buys_subcategory_path(params[:id].to_i)
      end
    elsif params[:controller] == "sells"
      if params[:action] == "show_category"
        sells_category_path(params[:id].to_i)
      elsif params[:action] == "show_subcategory"
        sells_subcategory_path(params[:id].to_i)
      end
    elsif params[:controller] == "profiles"
      if params[:action] == "show_category"
        profiles_category_path(params[:id].to_i)
      elsif params[:action] == "show_subcategory"
        profiles_subcategory_path(params[:id].to_i)
      end
    end
  end


  #for devise
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
