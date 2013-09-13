require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create post" do
  #  #removed for now, because there is no reason to test the post here, cause the projection creates it
  #  #maybe we could test something else here instead
  #end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  #test "should update post" do
  #  #removed for now, because there is no reason to test the update here, cause the projection updates it
  #  #maybe we could test something else here instead
  #end

  #test "should destroy post" do
  #  #removed for now, because there is no reason to test the destroy here, cause the projection destroys it
  #  #maybe we could test something else here instead
  #end
end