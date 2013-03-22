class Genre < ActiveRecord::Base
  attr_accessible :title, :description

  has_and_belongs_to_many :movies
end
