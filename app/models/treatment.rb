class Treatment < ApplicationRecord
  belongs_to :medical_appointment

  validates :title, :description, presence: true

  enum status: [
    :hemograma, 
    :colesterol, 
    :creatinina,
    :papanicolau,
    :urina,
    :glicemia,
    :transaminases,
    :tsh,
    :urocultura
  ]

  include OfAuthtable
  include FilesAttachable
  include Searchable
end
