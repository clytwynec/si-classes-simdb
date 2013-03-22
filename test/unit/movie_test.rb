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

  test "movie requires a unique title" do
    existing = create(:movie, title: "War Games")
    
    [existing.title, existing.title.downcase].each do |try_title|
      movie = build(:movie, title: try_title)

      assert !movie.save
      assert !movie.errors.blank?
      assert_equal 1, movie.errors.count
      assert_equal ["has already been taken"], movie.errors[:title]
    end
  end
end
