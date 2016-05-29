require 'test_helper'

class WinerUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @winer_user = winer_users(:one)
  end

  test "should get index" do
    get winer_users_url
    assert_response :success
  end

  test "should get new" do
    get new_winer_user_url
    assert_response :success
  end

  test "should create winer_user" do
    assert_difference('WinerUser.count') do
      post winer_users_url, params: { winer_user: { permissions: @winer_user.permissions, user_id: @winer_user.user_id, winery_id: @winer_user.winery_id } }
    end

    assert_redirected_to winer_user_path(WinerUser.last)
  end

  test "should show winer_user" do
    get winer_user_url(@winer_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_winer_user_url(@winer_user)
    assert_response :success
  end

  test "should update winer_user" do
    patch winer_user_url(@winer_user), params: { winer_user: { permissions: @winer_user.permissions, user_id: @winer_user.user_id, winery_id: @winer_user.winery_id } }
    assert_redirected_to winer_user_path(@winer_user)
  end

  test "should destroy winer_user" do
    assert_difference('WinerUser.count', -1) do
      delete winer_user_url(@winer_user)
    end

    assert_redirected_to winer_users_path
  end
end
