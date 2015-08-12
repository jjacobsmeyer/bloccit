require 'rails_helper'

describe VotesController do

  include Devise::TestHelpers
  include TestFactories

  describe '#up_vote' do
    it "adds an up-vote to the post" do
      @user = authenticated_user
      @post = associated_post
      sign_in @user

      request.env["HTTP_REFERER"] = '/'

      expect {
        post(:up_vote, post_id: @post.id)
      }.to change{ @post.up_votes }.by 1
    end
  end
end