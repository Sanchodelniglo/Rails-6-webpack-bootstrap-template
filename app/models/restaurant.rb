class Restaurant < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :place_id
  validates_numericality_of :rating
  validates_numericality_of :cost

  def opened_now?
    open ? 'Ouvert' : 'Fermé'
  end
end
