module Api
	module V1
    class ExamsController < ApplicationController
      before_action :set_exam, only: %i[ show update destroy ]

      # GET /exams
      # GET /exams.json
      def index
        @exams = Exam.all
      end

      # GET /exams/1
      # GET /exams/1.json
      def show
      end

      # POST /exams
      # POST /exams.json
      def create
        @exam = Exam.new(exam_params)

        if @exam.save
          render json: @exam, status: :created
        else
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
          @exam = Exam.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def exam_params
          params.require(:exam).permit(:id, :title, :date, :exam_location, :medical_appointment_id)
        end
    end
  end
end