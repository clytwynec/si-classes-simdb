class Role < ActiveRecord::Base
  attr_accessible :title, :rank, :movie, :person

  belongs_to :movie
  belongs_to :person
end
