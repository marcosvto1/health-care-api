module Api
  module V1
    class SharesController < ApiController
      include Shareable

      def medical_appointments
        @medical_appointments = MedicalAppointment.where(user_id: @share.user.id)
          .like(:title, params[:q]).page params[:page]
        render :medical_appointments
      end

      def exams
        @exams = Exam.where(user_id: @share.user.id)
          .like(:title, params[:q]).page params[:page]
        render :exams
      end

      def treatments
        @treatments = Treatment.where(user_id: @share.user_id).like(:title, params[:q]).page params[:page]
        render :treatments
      end
    end
  end
end
