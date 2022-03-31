class MedicalAppointment < ApplicationRecord
  validates :title, :professional_name, presence: true
  belongs_to :user

  include FilesAttachable
  include OfAuthtable
  include Searchable
end
