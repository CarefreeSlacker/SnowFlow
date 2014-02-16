# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    cart_id 1
    user_id 1
    country "MyString"
    region "MyString"
    post_code "MyString"
    lane "MyString"
    home "MyString"
    appartament "MyString"
    floor 1
    personal_payment false
    shipped ""
  end
end
