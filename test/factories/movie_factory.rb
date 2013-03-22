FactoryGirl.define do
  factory :movie do
    sequence(:title) { |num| "Star Wars #{RomanNumeral.get(num)}" }
    description "Some description about the movie"
    released_on 5.days.ago
  end
end
