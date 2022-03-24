module OfAuthtable
  extend ActiveSupport::Concern

  included do
    scope :of, ->(user) { where(:user => user) }
  end
end
