namespace :data do

  # A list of ~100 movie ids
  movie_ids = [278, 238, 603, 550, 1891, 122, 101, 240, 389, 11036, 805, 11, 78,
               348, 105, 280, 807, 197, 769, 213, 935, 19, 5925, 3082, 155, 120,
               680, 121, 752, 13, 2501, 857, 8587, 629, 274, 2493, 510, 583,
               77338, 489, 840, 567, 7549, 9461, 783, 829, 51162, 24238, 1607,
               27205, 8681, 679, 1892, 562, 85, 218, 89, 73, 762, 694, 424,
               5915, 1669, 68718, 782, 1091, 199, 289, 792, 871, 10331, 380,
               947, 665, 9314, 8764, 251, 9434, 2322, 832, 303, 475, 10681,
               10193, 98, 22, 10191, 45269, 77, 62, 862, 1124, 141, 8358, 497,
               153, 600, 949, 137, 747, 1542, 33, 5503]

  desc "Populate the database with data from TMDB"
  task :populate => :environment do

    Tmdb.api_key = ENV['TMDB_KEY']

    movie_ids.each do |movie_id|
      puts "Finding movie #{movie_id}"
      tmdb = TmdbMovie.find(id: movie_id)
      
      poser = tmdb.posters.first.sizes.original.url

      Movie.create(:title => tmdb.title,
                   :description => tmdb.overview,
                   :released_on => tmdb.release_date,
                   :poster_url => poser,
                   :tagline => tmdb.tagline,
                   :tmdb_id => movie_id,
                   :imdb_id => tmdb.imdb_id)
    end
  end

  desc "Update all movies with a single Genre"
  task :genreify => :environment do
    Tmdb.api_key = ENV['TMDB_KEY']

    movie_ids.each do |movie_id|
      puts "    Finding #{movie_id}..."
      movie = Movie.find_by_tmdb_id(movie_id)
      puts "*** Movie with tmdb_id = #{movie_id} not in DB." if movie.nil?
      next if movie.nil?

      tmdb = TmdbMovie.find(id: movie_id)
      puts "*** TMDB could not find movie #{movie_id}." if movie.nil?
      next if tmdb.nil?

      genre_names = tmdb.genres.map{ |g| g.name }
      genres = find_genres(genre_names)
      puts "*** '#{movie.title}' does not fit exisitng genre for #{genre_names}" if genres.nil?

      movie.genres = genres
      puts "*** Error saving '#{movie.title}' - #{movie.errors}" unless movie.save
    end
  end

private

  def find_genres(names)
    Genre.where("title in (?)", names)
  end
end
