class PostsController < ApplicationController
  include EventSource

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(id_param)
  end

  def new
    @post = CreatePostCommand.new
  end

  def edit
    @post = UpdatePostCommand.new Post.find(id_param).attributes
  end

  def create
    @post = CreatePostCommand.new post_params
    if store_event_id Domain.run_command(@post)
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @post = UpdatePostCommand.new post_params.merge(id: id_param)
    if store_event_id Domain.run_command(@post)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    delete_post = DeletePostCommand.new(id: id_param)
    if store_event_id Domain.run_command(delete_post)
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    else
      redirect_to post_url(id: id_param), alert: 'Post could not be deleted.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def id_param
    params.require(:id).to_i
  end
end
