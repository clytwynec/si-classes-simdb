class Movie < ActiveRecord::Base
  attr_accessible :title, :description, :released_on, :poster_url, :tagline, :tmdb_id, :imdb_id

  has_and_belongs_to_many :genres

  paginates_per 10

  validates :title, :description, :released_on, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
