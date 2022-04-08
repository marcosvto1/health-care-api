module Api
  module V1
    class UsersController < ApiController
      def index
        @users = User.where.not(id: current_user.id).like(:name, params[:q])
      end
    end
  end
end
