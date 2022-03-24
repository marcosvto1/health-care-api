class Exam < ApplicationRecord
  belongs_to :medical_appointment, optional: true
  belongs_to :user

  has_many_attached :files

  include OfAuthtable
end
