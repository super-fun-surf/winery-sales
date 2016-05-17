json.array!(@regions) do |region|
  json.extract! region, :id, :name, :county_id, :profile_image_id
  json.url region_url(region, format: :json)
end
