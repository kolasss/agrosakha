#encoding: utf-8
require 'csv'

#determine id of region for city
def region_id number
	@regions.each do |row|
		if row[0].to_i == number
			return row[2]
		end
	end
	
end

# Region.delete_all
csv_text = File.read('db/regions.csv')
@regions = CSV.parse(csv_text, :headers => false)

@regions.each do |row|
  # reg = Region.create!(:name => row[1], :country_id => ru.id)
  # row[2] = reg.id
  # puts reg.id
  puts row[0]
end
# puts 'Ru regions created'
# # puts @regions[-1][2]

# City.delete_all
csv_text = File.read('db/cities.csv')
cities = CSV.parse(csv_text, :headers => false)

cities.each do |row|
  # City.create!(:name => row[1], :region_id => region_id(row[4].to_i))
  puts row[0]
end
# puts 'Ru cities created'