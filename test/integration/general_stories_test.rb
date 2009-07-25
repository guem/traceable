require 'test_helper'

class GeneralStoriesTest < ActionController::IntegrationTest
  fixtures :process_trunks, :trunks

  test "new process trunk" do
    get '/process_trunks/new'
    assert_equal 200, status
    assert_template 'process_trunks/new'
    post '/process_trunks', :process_trunk => valid_process_trunk_attributes
    follow_redirect!
    assert_equal 200, status
    assert_template 'process_trunks/show'
  end
end
