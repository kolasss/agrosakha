#encoding: utf-8
require 'csv'

puts 'CREATING ROLES'
Role.delete_all
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
  { :name => 'guest' }
], :without_protection => true)

puts 'SETTING UP DEFAULT USER LOGIN'
User.delete_all
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please123', :password_confirmation => 'please123'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please123', :password_confirmation => 'please123'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :user

# determine id of region for city in DB
def region_id number
	@regions.each do |row|
		return row[2] if row[0].to_i == number
	end
	return false
end

Region.delete_all
csv_text = File.read('db/regions.csv')
@regions = CSV.parse(csv_text, :headers => false)

@regions.each do |row|
  reg = Region.create!(:name => row[1])
  row[2] = reg.id
end
puts 'Regions created'

City.delete_all
csv_text = File.read('db/cities.csv')
cities = CSV.parse(csv_text, :headers => false)

cities.each do |row|
  City.create!(:name => row[1], :region_id => region_id(row[0].to_i))
end
puts 'Cities created'

Category.delete_all
Category.create!([
	{ name: 'Продовольствие' },
	{ name: 'Животноводство' },
	{ name: 'Корма и добавки' },
	{ name: 'Посадочный материал' },
	{ name: 'Услуги' },
	{ name: 'Сельскохозяйственная техника' },
	{ name: 'Спецодежда и инвентарь' },
	{ name: 'Удобрения' },
	{ name: 'Другое' }
])
puts 'Categories created'

Subcategory.delete_all
cat = Category.where(:name => 'Животноводство').first
cat.subcategories.create!([
	{ name: 'Крупный рогатый скот' },
	{ name: 'Лошади' },
	{ name: 'Свиньи' },
	{ name: 'Птица' },
	{ name: 'Овцы и козы' },
	{ name: 'Северные олени' },
	{ name: 'Кролики' },
	{ name: 'Прочие' }
])

cat = Category.where(:name => 'Продовольствие').first
cat.subcategories.create!([
	{ name: 'Молочно-жировые товары' },
	{ name: 'Мясо и мясопродукты' },
	{ name: 'Овощи' },
	{ name: 'Фрукты и ягоды' },
	{ name: 'Рыба и рыбопродукты' },
	{ name: 'Крупы и муки' },
	{ name: 'Прочие' }
])
puts 'Subcategories created'