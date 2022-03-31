Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"
    
  namespace "api" do
    namespace "v1" do

      resources :medical_appointments
      resources :exams
      resources :treatments
      scope :shares do
        get ":share_id/medical_appointments", to: "shares#medical_appointments"
        get ":share_id/exams", to: "shares#exams"
        get ":share_id/treatments", to: "shares#treatments"
      end
      resources :user_shares
      scope :shares do
        get "medical_appointments", to: "shares#medical_appointments"
        get "exams", to: "shares#exams"
        get "treatments", to: "shares#treatments"
      end

      post 'password/forgot', to: 'passwords#forgot'
      post 'password/reset', to: 'passwords#reset'
      
    end
  end
end
