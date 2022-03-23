require "test_helper"

class MedicalAppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_appointment = medical_appointments(:one)
  end

  test "should get index" do
    get medical_appointments_url, as: :json
    assert_response :success
  end

  test "should create medical_appointment" do
    assert_difference("MedicalAppointment.count") do
      post medical_appointments_url, params: { medical_appointment: { date: @medical_appointment.date, professional_name: @medical_appointment.professional_name, title: @medical_appointment.title } }, as: :json
    end

    assert_response :created
  end

  test "should show medical_appointment" do
    get medical_appointment_url(@medical_appointment), as: :json
    assert_response :success
  end

  test "should update medical_appointment" do
    patch medical_appointment_url(@medical_appointment), params: { medical_appointment: { date: @medical_appointment.date, professional_name: @medical_appointment.professional_name, title: @medical_appointment.title } }, as: :json
    assert_response :success
  end

  test "should destroy medical_appointment" do
    assert_difference("MedicalAppointment.count", -1) do
      delete medical_appointment_url(@medical_appointment), as: :json
    end

    assert_response :no_content
  end
end
