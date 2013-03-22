class Person < ActiveRecord::Base
  attr_accessible :name, :photo_url, :tmdb_id, :roles, :movies

  has_many :roles
  has_many :movies, through: :roles
end
