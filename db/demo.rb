Faker::Config.locale = :en
12.times do
  OmdbApi::Search.item_by_title Faker::Book.title
end
