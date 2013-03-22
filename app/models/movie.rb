class Movie < ActiveRecord::Base
  attr_accessible :title, :description, :released_on, :poster_url, :tagline, :tmdb_id, :imdb_id, :roles, :people

  has_and_belongs_to_many :genres
  has_many :roles
  has_many :people, through: :roles

  paginates_per 10

  validates :title, :description, :released_on, presence: true
  validates :title, uniqueness: { case_sensitive: false }

  def director
    director_role = self.roles.find_by_title("Director")
    director_role.person if director_role
  end

  def self.afi_eligible
    Movie.where("released_on < ?", 10.years.ago)
  end
end
