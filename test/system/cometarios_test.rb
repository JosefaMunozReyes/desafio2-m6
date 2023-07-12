require "application_system_test_case"

class CometariosTest < ApplicationSystemTestCase
  setup do
    @cometario = cometarios(:one)
  end

  test "visiting the index" do
    visit cometarios_url
    assert_selector "h1", text: "Cometarios"
  end

  test "should create cometario" do
    visit cometarios_url
    click_on "New cometario"

    fill_in "Detalle", with: @cometario.detalle
    click_on "Create Cometario"

    assert_text "Cometario was successfully created"
    click_on "Back"
  end

  test "should update Cometario" do
    visit cometario_url(@cometario)
    click_on "Edit this cometario", match: :first

    fill_in "Detalle", with: @cometario.detalle
    click_on "Update Cometario"

    assert_text "Cometario was successfully updated"
    click_on "Back"
  end

  test "should destroy Cometario" do
    visit cometario_url(@cometario)
    click_on "Destroy this cometario", match: :first

    assert_text "Cometario was successfully destroyed"
  end
end
