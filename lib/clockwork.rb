require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  configure do |config|
    config[:sleep_timeout] = 30
    config[:logger] = Logger.new("log/clockwork_#{Rails.env}.log")
  end

  order_interval = Rails.env.production? ? 1.day : 1.minutes

  every(order_interval, 'Updating info from Google Analytics') {
    # Backburner.enqueue TimeisupOrderJob
    Sell.update_from_ga
    puts 'done.'
    }

end
