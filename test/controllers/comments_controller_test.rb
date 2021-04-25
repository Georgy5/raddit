require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @comment = comments(:one)
    # @link = links(:one)
    # @user = users(:seb)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
#    sign_in @user
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, params: { comment: { body: @comment.body, link_id: @comment.link_id, user_id: @comment.user_id } }
      # post :create, params: { link: { comment: { body: @comment.body, link_id: @comment.link, user_id: @comment.user } } }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, params: { id: @comment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @comment }
    assert_response :success
  end

  test "should update comment" do
#    sign_in @user
    patch :update, params: { id: @comment, comment: { body: @comment.body, link_id: @comment.link_id, user_id: @comment.user_id } }
    # assert_redirected_to comment_path(assigns(:comment))
    assert_redirected_to link_path(assigns(@comment.link))
  end

  test "should destroy comment" do
#    sign_in @user
    assert_difference('Comment.count', -1) do
      delete :destroy, params: { id: @comment }
    end

    assert_redirected_to comments_path
  end
end
