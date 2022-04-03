class ResetPasswordUserMailer < ApplicationMailer
  def email_reset_password_user(users)
    @users = users
    mail(to: @users.email, subject: "Recuperar Senha - Health")
  end
end
