class DropDirectorFromMovie < ActiveRecord::Migration
  def up
    Movie.all.each do |movie|
      person = Person.find(movie[:director_id])
      Role.create(person: person, movie: movie, title: "Director", rank: 0)
    end

    remove_column :movies, :director_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
