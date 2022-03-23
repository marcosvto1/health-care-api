require "test_helper"

class ExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam = exams(:one)
  end

  test "should get index" do
    get exams_url, as: :json
    assert_response :success
  end

  test "should create exam" do
    assert_difference("Exam.count") do
      post exams_url, params: { exam: { date: @exam.date, exam_location: @exam.exam_location, medical_appointment_id: @exam.medical_appointment_id, title: @exam.title } }, as: :json
    end

    assert_response :created
  end

  test "should show exam" do
    get exam_url(@exam), as: :json
    assert_response :success
  end

  test "should update exam" do
    patch exam_url(@exam), params: { exam: { date: @exam.date, exam_location: @exam.exam_location, medical_appointment_id: @exam.medical_appointment_id, title: @exam.title } }, as: :json
    assert_response :success
  end

  test "should destroy exam" do
    assert_difference("Exam.count", -1) do
      delete exam_url(@exam), as: :json
    end

    assert_response :no_content
  end
end
