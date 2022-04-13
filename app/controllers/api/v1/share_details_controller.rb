module Api
  module V1
    class ShareDetailsController < ApiController
      include Shareable

      def medical_appointment
        @medical_appointment = MedicalAppointment.find(params[:medical_appointment_id])
        render :medical_appointment
      end

      def exam
        @exam = Exam.find(params[:exam_id])
        render :exam
      end

      def treatment
        @treatment = Treatment.find(params[:treatment_id])
        render :treatment
      end
    end
  end
end
