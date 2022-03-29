module Shareable
  extend ActiveSupport::Concern

  included do
    before_action :accessible_share!

    def accessible_share!
      true
    end
  end
end
