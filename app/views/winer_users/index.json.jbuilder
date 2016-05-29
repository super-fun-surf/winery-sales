json.array!(@winer_users) do |winer_user|
  json.extract! winer_user, :id, :user_id, :winery_id, :permissions
  json.url winer_user_url(winer_user, format: :json)
end
