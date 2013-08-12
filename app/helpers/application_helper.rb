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

end
