require "test_helper"

class CircuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circuit = circuits(:one)
  end

  test "should get index" do
    get circuits_url, as: :json
    assert_response :success
  end

  test "should create circuit" do
    assert_difference('Circuit.count') do
      post circuits_url, params: { circuit: { compartimento_id: @circuit.compartimento_id, description: @circuit.description, kindbtn_id: @circuit.kindbtn_id, kinddev_id: @circuit.kinddev_id, name: @circuit.name, sttus: @circuit.sttus } }, as: :json
    end

    assert_response 201
  end

  test "should show circuit" do
    get circuit_url(@circuit), as: :json
    assert_response :success
  end

  test "should update circuit" do
    patch circuit_url(@circuit), params: { circuit: { compartimento_id: @circuit.compartimento_id, description: @circuit.description, kindbtn_id: @circuit.kindbtn_id, kinddev_id: @circuit.kinddev_id, name: @circuit.name, sttus: @circuit.sttus } }, as: :json
    assert_response 200
  end

  test "should destroy circuit" do
    assert_difference('Circuit.count', -1) do
      delete circuit_url(@circuit), as: :json
    end

    assert_response 204
  end
end
