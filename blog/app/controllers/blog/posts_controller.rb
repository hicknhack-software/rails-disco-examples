module Blog
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
      post = PostCreate.new({title: params[:post][:title], text: params[:post][:text]})
      valid = post.valid?
      if valid and Domain.run_command post
        flash[:notice] = 'Post wurde gespeichert.'
        redirect_to action: :index # success
      else
        flash[:error] = 'Dein Post kann nicht gespeichert werden!'
        redirect_to action: :new
      end
    end

    def update
      post = PostUpdate.new({id: params[:id], title: params[:post][:title], text: params[:post][:text]})
      valid = post.valid?
      if valid and Domain.run_command post
        flash[:notice] = 'Änderungen wurde gespeichert.'
        redirect_to action: :show, id: params[:id] # success
      else
        flash[:error] = 'Deine Änderungen können nicht gespeichert werden!'
        redirect_to action: :edit, id: params[:id]
      end
    end

    def destroy
      post = PostDelete.new id: params[:id]
      if Domain.run_command post
        flash[:notice] = 'Post wurde gelöscht.'
      else
        flash[:error] = 'Post konnte nicht gelöscht werden.'
      end
      redirect_to action: :index # success
    end

    private
    def set_post
      @post = Post.find(params[:id])
    end
  end
end