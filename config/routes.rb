Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"

  namespace "api" do
    namespace "v1" do
      get "me", to: "profiles#me"
      resources :medical_appointments
      resources :exams
      resources :treatments
      scope :shares do
        get ":share_id/medical_appointments", to: "shares#medical_appointments"
        get ":share_id/medical_appointments/:medical_appointment_id", to: "share_details#medical_appointment"

        get ":share_id/exams", to: "shares#exams"
        get ":share_id/exams/:exam_id", to: "share_details#exam"

        get ":share_id/treatments", to: "shares#treatments"
        get ":share_id/treatments/:treatment_id", to: "share_details#treatment"
      end
      resources :user_shares
      resources :shared_with_me
      resources :users, only: [:index, :show]
      scope :shares do
        get "medical_appointments", to: "shares#medical_appointments"
        get "exams", to: "shares#exams"
        get "treatments", to: "shares#treatments"
      end

      post "password/forgot", to: "passwords#forgot"
      post "password/reset", to: "passwords#reset"

      get "dashboard", to: "dashboard#index"

      delete "files/:id", to: "removes_files#destroy"
    end
  end
end
