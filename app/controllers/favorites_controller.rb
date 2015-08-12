class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    if favorite.save
      flash[:notice] = "Your favorite was saved."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error saving your favorite."
      render template: "post/show"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])
    authorize favorite 
    if favorite.destroy
      flash[:notice] = "Favorite successfully deleted!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error in deleting your favorite."
      redirect_to @post

      end
  end
end
