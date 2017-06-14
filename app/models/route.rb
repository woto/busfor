class Route < ApplicationRecord
  belongs_to :city_start, class_name: "City"
  belongs_to :station_start, class_name: "Station"
  belongs_to :city_end, class_name: "City"
  belongs_to :station_end, class_name: "Station"
  belongs_to :carrier, optional: true
  enum currency: Rails.configuration.currency

  validates :currency, :inclusion => {in: Rails.configuration.currency}
end
