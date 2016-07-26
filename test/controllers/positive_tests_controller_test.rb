require 'test_helper'

class PositiveTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @positive_test = positive_tests(:one)
  end

  test "should get index" do
    get positive_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_positive_test_url
    assert_response :success
  end

  test "should create positive_test" do
    assert_difference('PositiveTest.count') do
      post positive_tests_url, params: { positive_test: {  } }
    end

    assert_redirected_to positive_test_url(PositiveTest.last)
  end

  test "should show positive_test" do
    get positive_test_url(@positive_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_positive_test_url(@positive_test)
    assert_response :success
  end

  test "should update positive_test" do
    patch positive_test_url(@positive_test), params: { positive_test: {  } }
    assert_redirected_to positive_test_url(@positive_test)
  end

  test "should destroy positive_test" do
    assert_difference('PositiveTest.count', -1) do
      delete positive_test_url(@positive_test)
    end

    assert_redirected_to positive_tests_url
  end
end
