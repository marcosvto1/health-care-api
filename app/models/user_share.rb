class UserShare < ApplicationRecord
  belongs_to :user
  belongs_to :user_share, class_name: "User"

  validates :user_share_id, presence: true
  validates :end_date, presence: true, after_date: true
  validates_inclusion_of :medical_appointment, :exam, :treatment, in: [false, true]

  enum status: {
    activated: 1,
    cancelled: 2,
  }

  include OfAuthtable
end
