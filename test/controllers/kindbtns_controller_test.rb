require "test_helper"

class KindbtnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kindbtn = kindbtns(:one)
  end

  test "should get index" do
    get kindbtns_url, as: :json
    assert_response :success
  end

  test "should create kindbtn" do
    assert_difference('Kindbtn.count') do
      post kindbtns_url, params: { kindbtn: { name: @kindbtn.name } }, as: :json
    end

    assert_response 201
  end

  test "should show kindbtn" do
    get kindbtn_url(@kindbtn), as: :json
    assert_response :success
  end

  test "should update kindbtn" do
    patch kindbtn_url(@kindbtn), params: { kindbtn: { name: @kindbtn.name } }, as: :json
    assert_response 200
  end

  test "should destroy kindbtn" do
    assert_difference('Kindbtn.count', -1) do
      delete kindbtn_url(@kindbtn), as: :json
    end

    assert_response 204
  end
end
