class Exam < ApplicationRecord
  belongs_to :medical_appointment, optional: true

  # presence :title, :date, :exam_location, presence: true
end
