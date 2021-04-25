require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @link = links(:one)
    @user = users(:seb)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create link" do
    sign_in @user
    assert_difference('Link.count') do
      post :create, params: { link: { title: @link.title, url: @link.url } }
    end

    assert_redirected_to link_path(assigns(:link))
  end

  test "should show link" do
    sign_in @user
    get :show, params: { id: @link }
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, params: { id: @link }
    assert_response :success
  end

  test "should update link" do
    sign_in @user
    patch :update, params: { id: @link.id, link: { title: @link.title, url: @link.url } }
    assert_redirected_to link_path(assigns(:link))
  end

  test "should destroy link" do
    sign_in @user
    assert_difference('Link.count', -1) do
      delete :destroy, params: { id: @link.id }
    end

    assert_redirected_to links_path
  end
end
