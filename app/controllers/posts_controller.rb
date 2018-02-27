class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.group_id = params[:group_id]

    if @post.save
      respond_to do |format|
        format.html { redirect_to group_path(params[:group_id]), notice: 'post created' }
        format.js { }
      end
    else
      redirect_to group_path(params[:group_id]), notice: 'could not create post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
