class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comments = @post.comments
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.user = current_user
    @comment.post = @post
    authorize @comments
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render template: "posts/show"
    end
  end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"

    else
      flash[:error] = "Comment couldn't be deleted. Please try again."

    end

    respond_to do |format|
      format.html
      format.js
    end
    

  end


 end
