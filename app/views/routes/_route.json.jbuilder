json.extract! route, :id, :city_start_id, :station_start_id, :date_start, :city_end_id, :station_end_id, :date_end, :carrier_id, :cost, :currency, :created_at, :updated_at
json.url route_url(route, format: :json)
