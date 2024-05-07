require "test_helper"

class TermosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @termo = termos(:one)
  end

  test "should get index" do
    get termos_url
    assert_response :success
  end

  test "should get new" do
    get new_termo_url
    assert_response :success
  end

  test "should create termo" do
    assert_difference("Termo.count") do
      post termos_url, params: { termo: { descricao: @termo.descricao, titulo: @termo.titulo, usuario_id: @termo.usuario_id } }
    end

    assert_redirected_to termo_url(Termo.last)
  end

  test "should show termo" do
    get termo_url(@termo)
    assert_response :success
  end

  test "should get edit" do
    get edit_termo_url(@termo)
    assert_response :success
  end

  test "should update termo" do
    patch termo_url(@termo), params: { termo: { descricao: @termo.descricao, titulo: @termo.titulo, usuario_id: @termo.usuario_id } }
    assert_redirected_to termo_url(@termo)
  end

  test "should destroy termo" do
    assert_difference("Termo.count", -1) do
      delete termo_url(@termo)
    end

    assert_redirected_to termos_url
  end
end
