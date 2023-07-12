require "test_helper"

class CometariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cometario = cometarios(:one)
  end

  test "should get index" do
    get cometarios_url
    assert_response :success
  end

  test "should get new" do
    get new_cometario_url
    assert_response :success
  end

  test "should create cometario" do
    assert_difference("Cometario.count") do
      post cometarios_url, params: { cometario: { detalle: @cometario.detalle } }
    end

    assert_redirected_to cometario_url(Cometario.last)
  end

  test "should show cometario" do
    get cometario_url(@cometario)
    assert_response :success
  end

  test "should get edit" do
    get edit_cometario_url(@cometario)
    assert_response :success
  end

  test "should update cometario" do
    patch cometario_url(@cometario), params: { cometario: { detalle: @cometario.detalle } }
    assert_redirected_to cometario_url(@cometario)
  end

  test "should destroy cometario" do
    assert_difference("Cometario.count", -1) do
      delete cometario_url(@cometario)
    end

    assert_redirected_to cometarios_url
  end
end
