Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do 
      
      resources :medical_appointments
      resources :exams
      resources :treatments
      
    end
  end
end
