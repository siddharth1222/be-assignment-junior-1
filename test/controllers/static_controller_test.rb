# frozen_string_literal: true

require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get static_home_url
    assert_response :success
  end
end
