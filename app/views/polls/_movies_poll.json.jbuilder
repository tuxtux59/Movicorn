json.extract! movies_poll, :id, :create, :show, :created_at, :updated_at
json.url movies_poll_url(movies_poll, format: :json)
