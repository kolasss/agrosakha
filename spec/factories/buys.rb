# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :buy do
    title "MyString"
    body "MyString"
    count 1.5
    count_type nil
    price 1.5
    price_type 1
    city nil
    category nil
    subcategory nil
    user nil
  end
end
