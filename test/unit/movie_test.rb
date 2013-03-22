require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  [:title, :description, :released_on].each do |field|
    test "movies requires a #{field}" do
      movie = build(:movie, field => nil)
      assert !movie.save, "could save movie without having a #{field}"
      assert !movie.errors.blank?
      assert_equal 1, movie.errors.count
      assert_equal ["can't be blank"], movie.errors[field]

      valid_movie = build(:movie)
      movie.send("#{field}=",valid_movie.send(field))
      assert movie.save, "could not save a valid movie"
    end
  end
end
