class City < ApplicationRecord
  has_many :stations

  def to_s
    name
  end
end
