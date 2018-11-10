namespace :storage do

  desc "Update active storage for omdbitems"
  task update_omdb_records: :environment do
    OmdbItem.all.each(&:simple_update_async)
  end

end
