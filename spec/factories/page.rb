require 'random_data'

FactoryGirl.define do
  factory :page do
    title RandomData.random_word
    body RandomData.random_sentence
    private false
    user
  end
end
