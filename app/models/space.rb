class Space < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

  # def empty_reservation_incidences
  #   reservations.map { |r| r.update_attributes incidences: nil }.all?
  # end #

  def incidences
    reservations.map(&:incidences).compact
  end
end
