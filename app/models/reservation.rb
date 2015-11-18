class Reservation < ActiveRecord::Base
	belongs_to :space

	def add_incidence string
		update_attributes(incidences: read_attribute(:incidences).to_s + string + "|")
	end

	def incidences
    read_attribute(:incidences).to_s.split("|")
  end

  def incidences= att
    super att.is_a?(Array) ? att.join("|") : att
  end

  def remove_incidence string
  	update_attributes(incidences: read_attribute(:incidences).gsub(string + "|", ""))
  end

  def edit_incidence old_incidence, new_incidence
  	remove_incidence old_incidence
    add_incidence new_incidence
  end
end
