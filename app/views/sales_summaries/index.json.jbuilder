json.array!(@sales_summaries) do |sales_summary|
  json.extract! sales_summary, :id, :tasting_room_id, :num_of_tasters, :num_of_purchasers, :num_of_club_signups, :sales_in_dollars, :year, :month, :day
  json.url sales_summary_url(sales_summary, format: :json)
end
