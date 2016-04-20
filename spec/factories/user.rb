require 'random_data'

FactoryGirl.define do
  pw = RandomData.random_password
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    confirmed_at Time.now

    factory :user_with_created_pages do
      transient do
        created_pages_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:created_pages, evaluator.created_pages_count, user: user)
      end
    end

    factory :user_with_collaborating_pages do
      transient do
        collaborating_pages_count 3
      end
      after(:create) do |user, evaluator|
        create_list(:collaborating_pages, evaluator.collaborating_pages_count, user: user)
      end
    end
  end
end
