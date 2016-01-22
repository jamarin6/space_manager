class Incidence < ActiveRecord::Base
  belongs_to :reservation

  validates_presence_of :body

  # mas validaciones
end
