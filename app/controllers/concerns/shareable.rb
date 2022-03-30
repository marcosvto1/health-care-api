module Shareable
  extend ActiveSupport::Concern

  included do
    before_action :accessible_share

    def accessible_share
      @share = UserShare.find(params[:share_id])
      length_caracters = params[:action].size - 2
      action_controller = params[:action]
      attribute_name = action_controller[0..length_caracters]

      if (@share.end_date < Time.zone.now || @share[attribute_name] == false)
        render_not_available
      end
      true
    rescue
      render_not_available
    end

    private def render_not_available
      return render json: {
                      "error" => "Shared not availiable",
                    }
    end
  end
end
