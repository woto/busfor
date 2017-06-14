Dir[File.join(Rails.root, "db", "search_results", "*.yml")].each do |file_name|
  YAML.load_file(file_name).each do |yml|
    city_start = City.where(name: yml[:start_city_name]).first_or_create
    city_end = City.where(name: yml[:end_city_name]).first_or_create
    station_start = city_start.stations.where(name: yml[:station_begin_name]).first_or_create
    station_end = city_end.stations.where(name: yml[:station_end_name]).first_or_create
    date_start = Time.zone.parse("#{yml[:start_date]} #{yml[:start_time]}")
    date_end = Time.zone.parse("#{yml[:end_date]} #{yml[:end_time]}")
    carrier = Carrier.where(name: yml[:carrier_name]).first_or_create
    route = Route.where({
      city_start: city_start,
      city_end: city_end,
      station_start: station_start,
      station_end: station_end,
      date_start: date_start,
      date_end: date_end,
      carrier: carrier,
      cost: yml[:total_cost],
      currency: Route.currencies[yml[:currency].downcase]
    }).first_or_create
    unless route.persisted?
      puts "Unable to save route. #{route.errors.full_messages}"
      puts route.attributes
    end
  end
end
