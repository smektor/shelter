class PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = current_member.posts.build
  end

  def create
    @post = current_member.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Brawo! Dodałeś post.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit() end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post został zaktualizowany.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show() end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Usunięto post.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
