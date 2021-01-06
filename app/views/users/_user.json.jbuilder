json.extract! user, :id, :username, :fullname, :coverimage, :photo, :created_at, :updated_at
json.url user_url(user, format: :json)
