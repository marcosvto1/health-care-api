class Treatment < ApplicationRecord
  belongs_to :medical_appointment, optional: true
  belongs_to :user

  validates :title, :description, presence: true

  enum kind: {
    remedio: 0,
    fisioterapia: 1,
    estetico: 2,
    odontologico: 3,
    espiritual: 4,
    psicoterapico: 5,
  }

  include OfAuthtable
  include FilesAttachable
  include Searchable
end
