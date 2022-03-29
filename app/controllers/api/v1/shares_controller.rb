module Api
  module V1
    class SharesController < ApiController
      include Shareable

      def medical_appointments
        @medical_appointments = MedicalAppointment.page params[:page]
      end

      def exams
        @exams = Exam.all
      end

      def treatments
        @treatments = Treatment.all
      end
    end
  end
end
