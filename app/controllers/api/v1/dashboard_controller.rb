module Api
  module V1
    class DashboardController < ApiController
      def index
        medical_appointment
        exams
        treatments

        render json: {
          medical_appointments: @medical_appointment,
          exams: @exams,
          treatments: @treatments,
        }
      end

      private

      def medical_appointment
        @medical_appointment = MedicalAppointment.of(current_user).select(:id, :title, :date).order(created_at: :desc).take(3)
      end

      def exams
        @exams = Exam.of(current_user).select(:id, :title, :date).order(created_at: :desc).take(3)
      end

      def treatments
        @treatments = Treatment.of(current_user).select(:id, :title, :date).order(created_at: :desc).take(3)
      end
    end
  end
end
