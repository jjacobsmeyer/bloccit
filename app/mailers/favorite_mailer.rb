class FavoriteMailer < ApplicationMailer

  default from: "jacobsmeyertech@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@jjbloccit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@jjbloccit.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@jjbloccit.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end


end
