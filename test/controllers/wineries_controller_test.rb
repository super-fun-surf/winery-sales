require 'test_helper'

class WineriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @winery = wineries(:one)
  end

  test "should get index" do
    get wineries_url
    assert_response :success
  end

  test "should get new" do
    get new_winery_url
    assert_response :success
  end

  test "should create winery" do
    assert_difference('Winery.count') do
      post wineries_url, params: { winery: { estate: @winery.estate, name: @winery.name, num_of_employees: @winery.num_of_employees, profile_image_id: @winery.profile_image_id, region_id: @winery.region_id, reminder_days: @winery.reminder_days, year_established: @winery.year_established } }
    end

    assert_redirected_to winery_path(Winery.last)
  end

  test "should show winery" do
    get winery_url(@winery)
    assert_response :success
  end

  test "should get edit" do
    get edit_winery_url(@winery)
    assert_response :success
  end

  test "should update winery" do
    patch winery_url(@winery), params: { winery: { estate: @winery.estate, name: @winery.name, num_of_employees: @winery.num_of_employees, profile_image_id: @winery.profile_image_id, region_id: @winery.region_id, reminder_days: @winery.reminder_days, year_established: @winery.year_established } }
    assert_redirected_to winery_path(@winery)
  end

  test "should destroy winery" do
    assert_difference('Winery.count', -1) do
      delete winery_url(@winery)
    end

    assert_redirected_to wineries_path
  end
end
