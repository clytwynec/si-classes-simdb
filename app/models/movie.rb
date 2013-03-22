class Movie < ActiveRecord::Base
  attr_accessible :title, :description, :released_on, :poster_url, :tagline, :tmdb_id, :imdb_id, :roles, :people

  has_and_belongs_to_many :genres
  has_many :roles
  has_many :people, through: :roles

  paginates_per 10

  validates :title, :description, :released_on, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
