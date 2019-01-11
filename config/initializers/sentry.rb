# frozen_string_literal: true
#
if Rails.env.production?
  Raven.configure do |config|
    config.dsn = 'https://cb1e382f3a31443989db30d6183d18fa:f40f57dc24bb402ab1c7463ef61805e0@sentry.io/1320276'
  end
end
