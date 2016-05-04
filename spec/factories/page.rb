require 'random_data'

FactoryGirl.define do
  factory :page do
    title RandomData.random_word
    body RandomData.random_sentence
    private false

    factory :collaborating_page do
      private true
      transient do
        collaborators_count 3
      end

      after(:create) do |collaborating_page, evaluator|
        create_list(:user, evaluator.collaborators_count)
      end
    end
  end
end
