json.array!(@tasting_rooms) do |tasting_room|
  json.extract! tasting_room, :id, :name, :region_id, :winery_id, :year_established, :num_of_employees, :profile_image_id, :estate
  json.url tasting_room_url(tasting_room, format: :json)
end
