FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "username_#{n}"
    end
    password 'password'
    role 0
  end
end
