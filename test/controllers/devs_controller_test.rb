require "test_helper"

class DevsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dev = devs(:one)
  end

  test "should get index" do
    get devs_url, as: :json
    assert_response :success
  end

  test "should create dev" do
    assert_difference('Dev.count') do
      post devs_url, params: { dev: { name: @dev.name, sttus: @dev.sttus, tipo: @dev.tipo } }, as: :json
    end

    assert_response 201
  end

  test "should show dev" do
    get dev_url(@dev), as: :json
    assert_response :success
  end

  test "should update dev" do
    patch dev_url(@dev), params: { dev: { name: @dev.name, sttus: @dev.sttus, tipo: @dev.tipo } }, as: :json
    assert_response 200
  end

  test "should destroy dev" do
    assert_difference('Dev.count', -1) do
      delete dev_url(@dev), as: :json
    end

    assert_response 204
  end
end
