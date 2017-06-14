class City < ApplicationRecord
  has_many :stations
  validates :name, presence: true

  def to_s
    name
  end
end
