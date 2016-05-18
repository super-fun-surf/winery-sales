require 'test_helper'

class TastingRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasting_room = tasting_rooms(:one)
  end

  test "should get index" do
    get tasting_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_tasting_room_url
    assert_response :success
  end

  test "should create tasting_room" do
    assert_difference('TastingRoom.count') do
      post tasting_rooms_url, params: { tasting_room: { estate: @tasting_room.estate, name: @tasting_room.name, num_of_employees: @tasting_room.num_of_employees, profile_image_id: @tasting_room.profile_image_id, region_id: @tasting_room.region_id, winery_id: @tasting_room.winery_id, year_established: @tasting_room.year_established } }
    end

    assert_redirected_to tasting_room_path(TastingRoom.last)
  end

  test "should show tasting_room" do
    get tasting_room_url(@tasting_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_tasting_room_url(@tasting_room)
    assert_response :success
  end

  test "should update tasting_room" do
    patch tasting_room_url(@tasting_room), params: { tasting_room: { estate: @tasting_room.estate, name: @tasting_room.name, num_of_employees: @tasting_room.num_of_employees, profile_image_id: @tasting_room.profile_image_id, region_id: @tasting_room.region_id, winery_id: @tasting_room.winery_id, year_established: @tasting_room.year_established } }
    assert_redirected_to tasting_room_path(@tasting_room)
  end

  test "should destroy tasting_room" do
    assert_difference('TastingRoom.count', -1) do
      delete tasting_room_url(@tasting_room)
    end

    assert_redirected_to tasting_rooms_path
  end
end
