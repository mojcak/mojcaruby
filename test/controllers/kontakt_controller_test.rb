require 'test_helper'

class KontaktControllerTest < ActionController::TestCase
  test "should get kontakt" do
    get :kontakt
    assert_response :success
  end

end
