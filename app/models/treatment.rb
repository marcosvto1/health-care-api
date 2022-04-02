class Treatment < ApplicationRecord
  belongs_to :medical_appointment
  belongs_to :user

  validates :title, :description, presence: true

  enum kind: {
    hemograma: 0,
    colesterol: 1,
    creatinina: 2,
    papanicolau: 3,
    urina: 4,
    glicemia: 5,
    transaminases: 6,
    tsh: 7,
    urocultura: 8,
  }

  include OfAuthtable
  include FilesAttachable
  include Searchable
end
