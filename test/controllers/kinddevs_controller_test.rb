require "test_helper"

class KinddevsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kinddev = kinddevs(:one)
  end

  test "should get index" do
    get kinddevs_url, as: :json
    assert_response :success
  end

  test "should create kinddev" do
    assert_difference('Kinddev.count') do
      post kinddevs_url, params: { kinddev: { name: @kinddev.name } }, as: :json
    end

    assert_response 201
  end

  test "should show kinddev" do
    get kinddev_url(@kinddev), as: :json
    assert_response :success
  end

  test "should update kinddev" do
    patch kinddev_url(@kinddev), params: { kinddev: { name: @kinddev.name } }, as: :json
    assert_response 200
  end

  test "should destroy kinddev" do
    assert_difference('Kinddev.count', -1) do
      delete kinddev_url(@kinddev), as: :json
    end

    assert_response 204
  end
end
