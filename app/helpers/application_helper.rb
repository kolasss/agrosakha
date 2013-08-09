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

  #   date = 
  #   case 
  #   # display today's date as "today"
  #   when t >= Date.today then "today"
  #   # display yesterday's date as 'Yesterday'
  #   when (t >= Date.yesterday and t <= Date.today) then "yesterday"
  #   # otherwise, display date: eg. Mon 4th June
  #   else
  #     t.strftime("%A #{t.day.ordinalize} %B")
  #   end
  #   time = t.strftime(" #{t.strftime("%I").to_i}:%M%p").downcase
  #   date + time
  # end
end
