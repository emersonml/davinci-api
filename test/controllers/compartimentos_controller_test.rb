require "test_helper"

class CompartimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compartimento = compartimentos(:one)
  end

  test "should get index" do
    get compartimentos_url, as: :json
    assert_response :success
  end

  test "should create compartimento" do
    assert_difference('Compartimento.count') do
      post compartimentos_url, params: { compartimento: { name: @compartimento.name, patrimonio_id: @compartimento.patrimonio_id } }, as: :json
    end

    assert_response 201
  end

  test "should show compartimento" do
    get compartimento_url(@compartimento), as: :json
    assert_response :success
  end

  test "should update compartimento" do
    patch compartimento_url(@compartimento), params: { compartimento: { name: @compartimento.name, patrimonio_id: @compartimento.patrimonio_id } }, as: :json
    assert_response 200
  end

  test "should destroy compartimento" do
    assert_difference('Compartimento.count', -1) do
      delete compartimento_url(@compartimento), as: :json
    end

    assert_response 204
  end
end
