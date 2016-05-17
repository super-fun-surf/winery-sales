require 'test_helper'

class CountiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @county = counties(:one)
  end

  test "should get index" do
    get counties_url
    assert_response :success
  end

  test "should get new" do
    get new_county_url
    assert_response :success
  end

  test "should create county" do
    assert_difference('County.count') do
      post counties_url, params: { county: { name: @county.name, population: @county.population, profile_image_id: @county.profile_image_id } }
    end

    assert_redirected_to county_path(County.last)
  end

  test "should show county" do
    get county_url(@county)
    assert_response :success
  end

  test "should get edit" do
    get edit_county_url(@county)
    assert_response :success
  end

  test "should update county" do
    patch county_url(@county), params: { county: { name: @county.name, population: @county.population, profile_image_id: @county.profile_image_id } }
    assert_redirected_to county_path(@county)
  end

  test "should destroy county" do
    assert_difference('County.count', -1) do
      delete county_url(@county)
    end

    assert_redirected_to counties_path
  end
end
