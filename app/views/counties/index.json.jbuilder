json.array!(@counties) do |county|
  json.extract! county, :id, :name, :population, :profile_image_id
  json.url county_url(county, format: :json)
end
