require 'test_helper'

class NegativeTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @negative_test = negative_tests(:one)
  end

  test "should get index" do
    get negative_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_negative_test_url
    assert_response :success
  end

  test "should create negative_test" do
    assert_difference('NegativeTest.count') do
      post negative_tests_url, params: { negative_test: {  } }
    end

    assert_redirected_to negative_test_url(NegativeTest.last)
  end

  test "should show negative_test" do
    get negative_test_url(@negative_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_negative_test_url(@negative_test)
    assert_response :success
  end

  test "should update negative_test" do
    patch negative_test_url(@negative_test), params: { negative_test: {  } }
    assert_redirected_to negative_test_url(@negative_test)
  end

  test "should destroy negative_test" do
    assert_difference('NegativeTest.count', -1) do
      delete negative_test_url(@negative_test)
    end

    assert_redirected_to negative_tests_url
  end
end
