# frozen_string_literal: true

namespace :db do
  desc 'Demo the database'
  task demo: :environment do
    load('db/demo.rb') if File.exist?('db/demo.rb')
  end
end