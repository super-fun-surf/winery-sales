json.array!(@winery_users) do |winery_user|
  json.extract! winery_user, :id, :user_id, :winery_id, :permissions
  json.url winery_user_url(winery_user, format: :json)
end
