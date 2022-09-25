require "test_helper"

class PatrimoniosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patrimonio = patrimonios(:one)
  end

  test "should get index" do
    get patrimonios_url, as: :json
    assert_response :success
  end

  test "should create patrimonio" do
    assert_difference('Patrimonio.count') do
      post patrimonios_url, params: { patrimonio: { name: @patrimonio.name, tag: @patrimonio.tag } }, as: :json
    end

    assert_response 201
  end

  test "should show patrimonio" do
    get patrimonio_url(@patrimonio), as: :json
    assert_response :success
  end

  test "should update patrimonio" do
    patch patrimonio_url(@patrimonio), params: { patrimonio: { name: @patrimonio.name, tag: @patrimonio.tag } }, as: :json
    assert_response 200
  end

  test "should destroy patrimonio" do
    assert_difference('Patrimonio.count', -1) do
      delete patrimonio_url(@patrimonio), as: :json
    end

    assert_response 204
  end
end
