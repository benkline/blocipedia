require 'random_data'

FactoryGirl.define do
  factory :page do
    title RandomData.random_word
    body RandomData.random_sentence
  
    factory :page_with_collaborators do
      private true

      transient do
        collaborators_count 3
      end
      after(:create) do |page, evaluator|
        create_list(:collaborators, evaluator.collaborators_count, page: page)
      end
    end
  end
end
