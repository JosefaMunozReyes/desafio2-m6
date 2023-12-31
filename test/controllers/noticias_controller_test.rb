require "test_helper"

class NoticiasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @noticia = noticias(:one)
  end

  test "should get index" do
    get noticias_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_noticia_url
    assert_response :success
  end

  test "should create noticia" do
    sign_in users(:one)
    assert_difference("Noticia.count") do
      post noticias_url, params: { noticia: { descripcion: @noticia.descripcion, titulo: @noticia.titulo } }
    end

    assert_redirected_to noticia_url(Noticia.last)
  end

  test "should show noticia" do
    get noticia_url(@noticia)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_noticia_url(@noticia)
    assert_response :success
  end

  test "should update noticia" do
    sign_in users(:one)
    patch noticia_url(@noticia), params: { noticia: { descripcion: @noticia.descripcion, titulo: @noticia.titulo } }
    assert_redirected_to noticia_url(@noticia)
  end

  test "should destroy noticia" do
    sign_in users(:one)
    assert_difference("Noticia.count", -1) do
      delete noticia_url(@noticia)
    end

    assert_redirected_to noticias_url
  end
end
