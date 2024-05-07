require "application_system_test_case"

class TermosTest < ApplicationSystemTestCase
  setup do
    @termo = termos(:one)
  end

  test "visiting the index" do
    visit termos_url
    assert_selector "h1", text: "Termos"
  end

  test "should create termo" do
    visit termos_url
    click_on "New termo"

    fill_in "Descricao", with: @termo.descricao
    fill_in "Titulo", with: @termo.titulo
    fill_in "Usuario", with: @termo.usuario_id
    click_on "Create Termo"

    assert_text "Termo was successfully created"
    click_on "Back"
  end

  test "should update Termo" do
    visit termo_url(@termo)
    click_on "Edit this termo", match: :first

    fill_in "Descricao", with: @termo.descricao
    fill_in "Titulo", with: @termo.titulo
    fill_in "Usuario", with: @termo.usuario_id
    click_on "Update Termo"

    assert_text "Termo was successfully updated"
    click_on "Back"
  end

  test "should destroy Termo" do
    visit termo_url(@termo)
    click_on "Destroy this termo", match: :first

    assert_text "Termo was successfully destroyed"
  end
end
