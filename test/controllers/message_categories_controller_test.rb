require 'test_helper'

class MessageCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_category = message_categories(:one)
  end

  test "should get index" do
    get message_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_message_category_url
    assert_response :success
  end

  test "should create message_category" do
    assert_difference('MessageCategory.count') do
      post message_categories_url, params: { message_category: {  } }
    end

    assert_redirected_to message_category_url(MessageCategory.last)
  end

  test "should show message_category" do
    get message_category_url(@message_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_category_url(@message_category)
    assert_response :success
  end

  test "should update message_category" do
    patch message_category_url(@message_category), params: { message_category: {  } }
    assert_redirected_to message_category_url(@message_category)
  end

  test "should destroy message_category" do
    assert_difference('MessageCategory.count', -1) do
      delete message_category_url(@message_category)
    end

    assert_redirected_to message_categories_url
  end
end
