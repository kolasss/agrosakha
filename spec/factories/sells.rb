# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell do
    title "MyString"
    body "MyString"
    count 1.5
    count_type 1
    price 1.5
    price_type 1
    city nil
    category nil
    subcategory nil
  end
end
