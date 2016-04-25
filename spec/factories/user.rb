require 'random_data'

FactoryGirl.define do
  pw = RandomData.random_password
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    confirmed_at Time.now
    role 1

    factory :creator do
      transient do
        created_pages_count 2
      end

      after(:create) do |creator, evaluator|
        create_list(:page, evaluator.created_pages_count, private: true)
      end
    end

    factory :collaborator do
      transient do
        collaborating_pages_count 3
      end
      after(:create) do |collaborator, evaluator|
        create_list(:page, evaluator.collaborating_pages_count, private: true)
      end
    end
  end
end
