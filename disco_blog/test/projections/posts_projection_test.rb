require 'test_helper'

class PostsProjectionTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
    @projection = PostProjection.new
  end

  test "should create post" do
    assert_difference('Post.count') do
      @projection.post_create_event(PostCreateEvent.new({id: 1000, title: 'test', text: 'test'}))
    end

  end

  test "should update post" do
    @projection.post_update_event(PostUpdateEvent.new({id: @post.id, title: 'test', text: 'test'}))
    updated_post = Post.find(@post.id)
    assert_equal 'test', updated_post.title
    assert_equal 'test', updated_post.text
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      @projection.post_delete_event(PostDeleteEvent.new({id: @post.id}))
    end
  end
end
