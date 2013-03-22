class Genre < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :movies
end
