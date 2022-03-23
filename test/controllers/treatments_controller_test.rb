require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment = treatments(:one)
  end

  test "should get index" do
    get treatments_url, as: :json
    assert_response :success
  end

  test "should create treatment" do
    assert_difference("Treatment.count") do
      post treatments_url, params: { treatment: { date: @treatment.date, description: @treatment.description, kind: @treatment.kind, medical_appointment_id: @treatment.medical_appointment_id, title: @treatment.title, treatment_location: @treatment.treatment_location } }, as: :json
    end

    assert_response :created
  end

  test "should show treatment" do
    get treatment_url(@treatment), as: :json
    assert_response :success
  end

  test "should update treatment" do
    patch treatment_url(@treatment), params: { treatment: { date: @treatment.date, description: @treatment.description, kind: @treatment.kind, medical_appointment_id: @treatment.medical_appointment_id, title: @treatment.title, treatment_location: @treatment.treatment_location } }, as: :json
    assert_response :success
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete treatment_url(@treatment), as: :json
    end

    assert_response :no_content
  end
end
