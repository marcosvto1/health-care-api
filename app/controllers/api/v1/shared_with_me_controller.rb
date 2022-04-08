module Api
  module V1
    class SharedWithMeController < ApiController
      def index
        @user_shares = UserShare.where(user_share_id: current_user.id).page(params[:page])
      end
    end
  end
end
