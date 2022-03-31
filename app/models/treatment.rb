class Treatment < ApplicationRecord
  belongs_to :medical_appointment

  validates :title, :description, presence: true

  include OfAuthtable
  include FilesAttachable
  include Searchable
end
