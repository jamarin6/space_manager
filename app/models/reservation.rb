class Reservation < ActiveRecord::Base
	belongs_to :space

	def add_incidence string
		update_attributes(incidences: read_attribute(:incidences).to_s + string + "|")
	end

	def incidences
    read_attribute(:incidences).to_s.split("|")
  end

  def remove_incidence string
  	update_attributes(incidences: read_attribute(:incidences).gsub(string, ""))
  	# habría que ver q la longitud disminuye en 1 ???
  end
end
