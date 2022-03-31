module Api
	module V1
    class PasswordsController < ApplicationController
      # skip_before_action :authenticate_user!

      def forgot
        if params[:email].blank?
          return render json: {error: 'O e-mail não está presente!'}
        end

        @user = User.find_by(email: params[:email])

        if @user.present?
          @user.generate_password_token! 
          ResetPasswordUserMailer.email_reset_password_user(@user).deliver
          render json: {status: 'E-mail com token enviado com sucesso. Por favor, verifique o seu e-mail'}, status: :ok
        else
          render json: {error: ['Endereço de e-mail não identificado. Por favor tente novamente.']}, status: :not_found
        end
      end
      
      def reset
        token = params[:token].to_s

        if params[:email].blank?
          return render json: {error: 'O Token não está presente. Favor inserir um Token válido'}      
        end

        user = User.find_by(reset_password_token: token)

        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: {status: 'Senha alterada com sucesso!'}, status: :ok
          else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
          end
        else
          render json: {error: ['Token inválido ou expirado. Por favor gere um novo token.']}, status: :not_found
        end
      end
    end
  end
end