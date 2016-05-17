json.array!(@wineries) do |winery|
  json.extract! winery, :id, :name, :region_id, :year_established, :num_of_employees, :profile_image_id, :estate, :reminder_days
  json.url winery_url(winery, format: :json)
end
