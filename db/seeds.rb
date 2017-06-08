Dir[File.join(Rails.root, "db", "search_results", "*.yml")].each do |file_name|
  YAML.load_file(file_name).each do |yml|
    start_city_name = City.where(name: yml[:start_city_name]).first_or_create
    end_city_name = City.where(name: yml[:end_city_name]).first_or_create
    station_begin_name = start_city_name.stations.where(name: yml[:station_begin_name]).first_or_create
    station_end_name = end_city_name.stations.where(name: yml[:station_end_name]).first_or_create
    carrier_name = Carrier.where(name: yml[:carrier_name]).first_or_create
  end
end
