Faker::Config.locale = :en
12.times do
  OmdbApi::Search.item_by_title Faker::Book.title
end

File.open("db/movies.txt", "r").each_line do |movie_title|
  OmdbApi::Search.item_by_title movie_title
end