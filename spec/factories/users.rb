FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end

    factory :premium do
      after(:create) {|user| user.add_role(:premium)}
    end

    factory :standard do
      after(:create) {|user| user.add_role(:standard)}
    end
  end
end
