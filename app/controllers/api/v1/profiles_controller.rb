module Api
  module V1
    class ProfilesController < ApiController
      def me
        @user = current_user
        render :me
      end
    end
  end
end
