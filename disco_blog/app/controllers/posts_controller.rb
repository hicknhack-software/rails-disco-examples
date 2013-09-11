
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    post = PostCreateCommand.new({title: params[:post][:title], text: params[:post][:text]})
    valid = post.valid?
    if valid and Domain.run_command post
      flash[:notice] = 'Post was successfully created.'
      redirect_to action: :index
    else
      flash[:error] = 'Post couldn\'t be created.'
      redirect_to action: :new
    end
  end

  def update
    post = PostUpdateCommand.new({id: params[:id], title: params[:post][:title], text: params[:post][:text]})
    valid = post.valid?
    if valid and Domain.run_command post
      flash[:notice] = 'Post was successfully updated.'
      redirect_to action: :show, id: params[:id]
    else
      flash[:error] = 'Post couldn\'t be updated.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    post = PostDeleteCommand.new({id: params[:id]})
    if Domain.run_command post
      flash[:notice] = 'Post was successfully deleted.'
    else
      flash[:error] = 'Post couldn\'t be deleted.'
    end
    redirect_to action: :index
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end

