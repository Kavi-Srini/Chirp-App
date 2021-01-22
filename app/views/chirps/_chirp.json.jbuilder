json.extract! chirp, :id, :message, :user_id, :created_at, :updated_at
json.url chirp_url(chirp, format: :json)
