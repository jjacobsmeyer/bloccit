require 'rails_helper'

describe Comment do

  include TestFactories

  describe "after_create" do

    before do
      @post = associated_post
      @user = authenticated_user(email_favorites: true)
      @other_user = authenticeated_user
      @comment = Comment.new(body: 'My comment is really', post: @post, user: @other_user)
    end

    it "sends an email to users who have favorited  the post" do
      favorite = @user.favorites.create(post: @post)

      allow(FavoriteMailer)
        .to receive(:new_comment)

        @comment.save
      end
    end
  end
  
