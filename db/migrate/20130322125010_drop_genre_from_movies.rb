class DropGenreFromMovies < ActiveRecord::Migration
  def up
    Movie.all.each do |movie|
      genre = Genre.find(movie[:genre_id])
      movie.genres << genre
    end

    remove_column :movies, :genre_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
