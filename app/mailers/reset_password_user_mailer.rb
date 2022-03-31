class ResetPasswordUserMailer < ApplicationMailer
  def email_reset_password_user(users)
    @users = users
    mail(to: "noreply@health.com.br", subject: 'Recuperar Senha - Health')    
  end
end
