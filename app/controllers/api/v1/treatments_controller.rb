module Api
  module V1
    class TreatmentsController < ApiController
      before_action :set_treatment, only: %i[ show update destroy ]

      # GET /treatments
      # GET /treatments.json
      def index
        @treatments = Treatment.like(:title, params[:q]).page params[:page]
      end

      # GET /treatments/1
      # GET /treatments/1.json
      def show
      end

      # POST /treatments
      # POST /treatments.json
      def create
        @treatment = Treatment.new(treatment_params)

        if @treatment.save
          render json: @treatment, status: :created
        else
          render json: @treatment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /treatments/1
      # PATCH/PUT /treatments/1.json
      def update
        if @treatment.update(treatment_params)
          render json: @treatment, status: :ok
        else
          render json: @treatment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /treatments/1
      # DELETE /treatments/1.json
      def destroy
        @treatment.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_treatment
        @treatment = Treatment.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def treatment_params
        params.require(:treatment).permit(:id, :title, :description, :date, :treatment_location, :kind, :medical_appointment_id, files: [])
      end
    end
  end
end
