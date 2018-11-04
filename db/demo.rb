File.open("db/movies.txt", "r").each_line do |movie_title|
  OmdbApi::Search.item_by_title movie_title
end