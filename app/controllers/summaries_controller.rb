class SummariesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:body))
    @summary.post = @post
    @summary.save
    redirect_to [@post, @summary]
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    @summary.update_attributes(params.require(:summary).permit(:body))
    redirect_to [@post, @summary]
  end

end
