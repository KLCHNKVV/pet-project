require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @page = 'Page'
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select 'title', "RoR Sample Web Application"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select 'title', "Help #{@page}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', "About #{@page}"
  end

end
