module Shareable
  extend ActiveSupport::Concern

  included do
    before_action :accessible_share

    def accessible_share
      @share = UserShare.find(params[:share_id])
      true
    rescue
      return render json: {
                      "error" => "Shared not availiable",
                    }
    end
  end
end
