require 'test_helper'

class RecurringMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recurring_message = recurring_messages(:one)
  end

  test "should get index" do
    get recurring_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_recurring_message_url
    assert_response :success
  end

  test "should create recurring_message" do
    assert_difference('RecurringMessage.count') do
      post recurring_messages_url, params: { recurring_message: { body: @recurring_message.body, conversation_id: @recurring_message.conversation_id, end_date: @recurring_message.end_date, frequency: @recurring_message.frequency, start_date: @recurring_message.start_date, to: @recurring_message.to, user_id: @recurring_message.user_id } }
    end

    assert_redirected_to recurring_message_url(RecurringMessage.last)
  end

  test "should show recurring_message" do
    get recurring_message_url(@recurring_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_recurring_message_url(@recurring_message)
    assert_response :success
  end

  test "should update recurring_message" do
    patch recurring_message_url(@recurring_message), params: { recurring_message: { body: @recurring_message.body, conversation_id: @recurring_message.conversation_id, end_date: @recurring_message.end_date, frequency: @recurring_message.frequency, start_date: @recurring_message.start_date, to: @recurring_message.to, user_id: @recurring_message.user_id } }
    assert_redirected_to recurring_message_url(@recurring_message)
  end

  test "should destroy recurring_message" do
    assert_difference('RecurringMessage.count', -1) do
      delete recurring_message_url(@recurring_message)
    end

    assert_redirected_to recurring_messages_url
  end
end
