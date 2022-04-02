class Treatment < ApplicationRecord
  belongs_to :medical_appointment
  belongs_to :user

  validates :title, :description, presence: true

  enum kind: [
    :hemograma,
    :colesterol,
    :creatinina,
    :papanicolau,
    :urina,
    :glicemia,
    :transaminases,
    :tsh,
    :urocultura,
  ]

  include OfAuthtable
  include FilesAttachable
  include Searchable
end
