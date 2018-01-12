json.extract! message, :id, :body, :place, :created_at, :updated_at
json.url message_url(message, format: :json)
