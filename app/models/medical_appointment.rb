class MedicalAppointment < ApplicationRecord
  validates :title, :professional_name, presence: true
  include FilesAttachable
  include OfAuthtable
end
