class Station < ApplicationRecord
  belongs_to :city
  validates :name, presence: true

  def to_s
    name
  end
end
