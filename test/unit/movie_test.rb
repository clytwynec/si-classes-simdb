require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  [:title, :description, :released_on].each do |field|
    test "movies requires a #{field}" do
      movie = build(:movie, field => nil)
      assert_save_error movie, field, "can't be blank"

      valid_movie = build(:movie)
      movie.send("#{field}=",valid_movie.send(field))
      assert movie.save, "could not save a valid movie"
    end
  end

  test "movie requires a unique title" do
    existing = create(:movie, title: "War Games")
    
    [existing.title, existing.title.downcase].each do |try_title|
      movie = build(:movie, title: try_title)
      assert_save_error movie, :title, "has already been taken"
    end
  end

private

  def assert_save_error(model, field, error_message)
    model_name = model.class.name
    assert !model.save, "could save #{model_name} with invalid #{field}"
    assert !model.errors.blank?, "#{model_name} with invalid #{field} should have gven an error"
    assert_equal 1, model.errors.count
    assert_equal [error_message], model.errors[field]
  end
end
