require "test_helper"

class CentralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @central = centrals(:one)
  end

  test "should get index" do
    get centrals_url, as: :json
    assert_response :success
  end

  test "should create central" do
    assert_difference('Central.count') do
      post centrals_url, params: { central: { name: @central.name, sttus: @central.sttus, tipo: @central.tipo } }, as: :json
    end

    assert_response 201
  end

  test "should show central" do
    get central_url(@central), as: :json
    assert_response :success
  end

  test "should update central" do
    patch central_url(@central), params: { central: { name: @central.name, sttus: @central.sttus, tipo: @central.tipo } }, as: :json
    assert_response 200
  end

  test "should destroy central" do
    assert_difference('Central.count', -1) do
      delete central_url(@central), as: :json
    end

    assert_response 204
  end
end
