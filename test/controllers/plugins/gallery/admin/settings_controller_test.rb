require 'test_helper'

class Plugins::Gallery::Admin::SettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
