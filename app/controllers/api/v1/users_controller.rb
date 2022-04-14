module Api
  module V1
    class UsersController < ApiController
      def index
        @users = User.where.not(id: current_user.id).like(:name, params[:q])
      end

      def show
        @user = current_user
        render :show
      end
    end
  end
end
