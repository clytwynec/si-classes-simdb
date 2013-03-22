module GenresHelper
  def genre_list(genres)
    genres.map{|g| g.title}.join(", ")
  end
end

