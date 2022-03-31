module Api
  module V1
    class UserSharesController < ApiController
      class UserInvalidException < StandardError; end

      def index
        @user_shares = UserShare.of(current_user).page params[:page]
      end

      def create
        valid_user_to_share!
        @user_share = UserShare.new(shares_params)
        @user_share.user = current_user
        if @user_share.save
          render :show
        else
          render json: @user_share.errors
        end
      rescue UserInvalidException => e
        render json: { user_shared_id: [e.message] }, status: :unprocessable_entity
      end

      def destroy
        @user_share = UserShare.of(current_user).find(params[:id])
        @user_share.status = :cancelled
        if @user_share.save
          render json: {}, status: :no_content
        else
          render json: @user_share.errors
        end
      end

      private

      def shares_params
        params.require(:user_share).permit(:end_date, :status, :medical_appointment, :exam, :treatment, :user_share_id)
      end

      def valid_user_to_share!
        raise UserInvalidException.new("Invalid user") if current_user.id == params[:user_share_id]
      end
    end
  end
end
