class Exam < ApplicationRecord
  belongs_to :medical_appointment, optional: true
  belongs_to :user

  include OfAuthtable
  include FilesAttachable
end
