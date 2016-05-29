require 'test_helper'

class WineryUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @winery_user = winery_users(:one)
  end

  test "should get index" do
    get winery_users_url
    assert_response :success
  end

  test "should get new" do
    get new_winery_user_url
    assert_response :success
  end

  test "should create winery_user" do
    assert_difference('WineryUser.count') do
      post winery_users_url, params: { winery_user: { permissions: @winery_user.permissions, user_id: @winery_user.user_id, winery_id: @winery_user.winery_id } }
    end

    assert_redirected_to winery_user_path(WineryUser.last)
  end

  test "should show winery_user" do
    get winery_user_url(@winery_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_winery_user_url(@winery_user)
    assert_response :success
  end

  test "should update winery_user" do
    patch winery_user_url(@winery_user), params: { winery_user: { permissions: @winery_user.permissions, user_id: @winery_user.user_id, winery_id: @winery_user.winery_id } }
    assert_redirected_to winery_user_path(@winery_user)
  end

  test "should destroy winery_user" do
    assert_difference('WineryUser.count', -1) do
      delete winery_user_url(@winery_user)
    end

    assert_redirected_to winery_users_path
  end
end
