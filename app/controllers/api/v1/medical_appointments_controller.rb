module Api
	module V1
    class MedicalAppointmentsController < ApplicationController
      before_action :set_medical_appointment, only: %i[ show update destroy ]

      # GET /medical_appointments
      # GET /medical_appointments.json
      def index
        @medical_appointments = MedicalAppointment.all
      end

      # GET /medical_appointments/1
      # GET /medical_appointments/1.json
      def show
        render json: @medical_appointment
      end

      # POST /medical_appointments
      # POST /medical_appointments.json
      def create
        @medical_appointment = MedicalAppointment.new(medical_appointment_params)

        if @medical_appointment.save
          render json: @medical_appointment, status: :created
        else
          render json: @medical_appointment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /medical_appointments/1
      # PATCH/PUT /medical_appointments/1.json
      def update
        if @medical_appointment.update(medical_appointment_params)
          render json: @medical_appointment, status: :ok
        else
          render json: @medical_appointment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /medical_appointments/1
      # DELETE /medical_appointments/1.json
      def destroy
        @medical_appointment.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_medical_appointment
          @medical_appointment = MedicalAppointment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def medical_appointment_params
          params.require(:medical_appointment).permit(:id, :title, :professional_name, :date)
        end
    end
  end
end