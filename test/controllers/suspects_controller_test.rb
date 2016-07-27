require 'test_helper'

class SuspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suspect = suspects(:one)
  end

  test "should get index" do
    get suspects_url
    assert_response :success
  end

  test "should get new" do
    get new_suspect_url
    assert_response :success
  end

  test "should create suspect" do
    assert_difference('Suspect.count') do
      post suspects_url, params: { suspect: {  } }
    end

    assert_redirected_to suspect_url(Suspect.last)
  end

  test "should show suspect" do
    get suspect_url(@suspect)
    assert_response :success
  end

  test "should get edit" do
    get edit_suspect_url(@suspect)
    assert_response :success
  end

  test "should update suspect" do
    patch suspect_url(@suspect), params: { suspect: {  } }
    assert_redirected_to suspect_url(@suspect)
  end

  test "should destroy suspect" do
    assert_difference('Suspect.count', -1) do
      delete suspect_url(@suspect)
    end

    assert_redirected_to suspects_url
  end
end
