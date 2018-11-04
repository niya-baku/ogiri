require 'test_helper'

class OdaisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get odais_index_url
    assert_response :success
  end

end
