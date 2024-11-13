require "test_helper"

class LegoSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lego_sets_index_url
    assert_response :success
  end

  test "should get show" do
    get lego_sets_show_url
    assert_response :success
  end
end
