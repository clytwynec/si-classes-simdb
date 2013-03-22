FactoryGirl.define do
  factory :movie do
    title "A Movie Title"
    description "Some description about the movie"
    released_on 5.days.ago
  end
end
