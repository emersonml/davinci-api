require "test_helper"

class BtnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @btn = btns(:one)
  end

  test "should get index" do
    get btns_url, as: :json
    assert_response :success
  end

  test "should create btn" do
    assert_difference('Btn.count') do
      post btns_url, params: { btn: { kindbtn_id: @btn.kindbtn_id, name: @btn.name, sttus: @btn.sttus } }, as: :json
    end

    assert_response 201
  end

  test "should show btn" do
    get btn_url(@btn), as: :json
    assert_response :success
  end

  test "should update btn" do
    patch btn_url(@btn), params: { btn: { kindbtn_id: @btn.kindbtn_id, name: @btn.name, sttus: @btn.sttus } }, as: :json
    assert_response 200
  end

  test "should destroy btn" do
    assert_difference('Btn.count', -1) do
      delete btn_url(@btn), as: :json
    end

    assert_response 204
  end
end
