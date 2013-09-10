# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ga_pageviews_record do
    model_type "MyString"
    model_id 1
    pageviews 1
    unique_pageviews 1
  end
end
