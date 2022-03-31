module Api
  module V1
    class ExamsController < ApiController
      before_action :set_exam, only: %i[ show update destroy ]

      # GET /exams
      # GET /exams.json
      def index
        @exams = Exam.of(current_user).like(:title, params[:q]).page params[:page]
      end

      # GET /exams/1
      # GET /exams/1.json
      def show
      end

      # POST /exams
      # POST /exams.json
      def create
        @exam = Exam.new(exam_params)
        @exam.user = current_user

        if @exam.save
          render json: @exam, status: :created
        else
          byebug
          render json: @exam.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /exams/1
      # PATCH/PUT /exams/1.json
      def update
        if @exam.update(exam_params)
          render json: @exam, status: :ok
        else
          render json: @exam.errors, status: :unprocessable_entity
        end
      end

      # DELETE /exams/1
      # DELETE /exams/1.json
      def destroy
        @exam.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_exam
        @exam = Exam.of(current_user).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def exam_params
        params.require(:exam).permit(:id, :title, :date, :exam_location, :medical_appointment_id, files: [])
      end
    end
  end
end
