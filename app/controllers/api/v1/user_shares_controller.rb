module Api
  module V1
    class UserSharesController < ApiController
      class UserInvalidException < StandardError; end
      class ThereIsAlreadyShareException < StandardError; end

      def index
        @user_shares = UserShare.of(current_user).page(params[:page]).order(created_at: :desc)
      end

      def create
        valid_user_to_share!
        @user_share = UserShare.new(shares_params)
        @user_share.user = current_user
        if @user_share.save
          render :show
        else
          render json: { errors: @user_share.errors }, status: :unprocessable_entity
        end
      rescue UserInvalidException, ThereIsAlreadyShareException => e
        render json: { errors: { user_shared_id: [e.message] } }, status: :unprocessable_entity
      end

      def destroy
        @user_share = UserShare.of(current_user).find(params[:id])
        @user_share.status = :cancelled
        if @user_share.save
          render json: {}, status: :no_content
        else
          render json: @user_share.errors, status: :unprocessable_entity
        end
      end

      private

      def shares_params
        params.require(:user_share).permit(:end_date, :status, :medical_appointment, :exam, :treatment, :user_share_id)
      end

      def valid_user_to_share!
        raise UserInvalidException.new("Invalid user") if current_user.id == params[:user_share_id]
        raise ThereIsAlreadyShareException.new("Já existe um compartilhamento para esse usuário") unless UserShare.find_by(user_share_id: params[:user_share_id], status: :activated, user_id: current_user.id).blank?
      end
    end
  end
end
