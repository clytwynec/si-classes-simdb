require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movies require a title" do
    movie = build(:movie, title: nil)
    assert !movie.save, "could save movie without having a title"
    assert !movie.errors.blank?
    assert_equal 1, movie.errors.count
    assert_equal ["can't be blank"], movie.errors[:title]

    movie.title = 'Some title'
    assert movie.save, "could not save a valid movie"
  end
end
