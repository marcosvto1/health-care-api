Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"
  namespace "api" do
    namespace "v1" do
      resources :medical_appointments
      resources :exams
      resources :treatments
      resources :user_shares
    end
  end
end
