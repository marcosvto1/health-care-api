class MedicalAppointment < ApplicationRecord
      
  validates :title, :professional_name, presence: true
end
