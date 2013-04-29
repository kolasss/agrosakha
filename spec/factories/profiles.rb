# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    user nil
    name "MyString"
    inn 1
    city nil
    region nil
    address "MyString"
    phone "MyString"
    desc "MyString"
  end
end
