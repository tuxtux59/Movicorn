require 'test_helper'

class Movies::PollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movies_poll = movies_polls(:one)
  end

  test "should get index" do
    get movies_polls_url
    assert_response :success
  end

  test "should get new" do
    get new_movies_poll_url
    assert_response :success
  end

  test "should create movies_poll" do
    assert_difference('Movies::Poll.count') do
      post movies_polls_url, params: { movies_poll: { create: @movies_poll.create, show: @movies_poll.show } }
    end

    assert_redirected_to movies_poll_url(Movies::Poll.last)
  end

  test "should show movies_poll" do
    get movies_poll_url(@movies_poll)
    assert_response :success
  end

  test "should get edit" do
    get edit_movies_poll_url(@movies_poll)
    assert_response :success
  end

  test "should update movies_poll" do
    patch movies_poll_url(@movies_poll), params: { movies_poll: { create: @movies_poll.create, show: @movies_poll.show } }
    assert_redirected_to movies_poll_url(@movies_poll)
  end

  test "should destroy movies_poll" do
    assert_difference('Movies::Poll.count', -1) do
      delete movies_poll_url(@movies_poll)
    end

    assert_redirected_to movies_polls_url
  end
end
