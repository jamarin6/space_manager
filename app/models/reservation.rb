class Reservation < ActiveRecord::Base
	belongs_to :space
  has_many :incidences

  accepts_nested_attributes_for :incidences
end
