class Person < ActiveRecord::Base
  attr_accessible :name, :photo_url, :tmdb_id

  has_many :movies, :inverse_of => :director, :foreign_key => 'director_id'
end
