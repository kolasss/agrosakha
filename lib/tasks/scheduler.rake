desc "This task is called by the Heroku scheduler add-on"

task :parse_ga => :environment do
  puts "Updating info from Google Analytics"
  Sell.update_from_ga
  puts "done."
end
