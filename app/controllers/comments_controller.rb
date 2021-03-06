class CommentsController < ApplicationController
  before_action :set_article, only: %i[new create]

  def new
    @comment = @article.comments.new
  end

  def create
    @comment = @article.comments.create!(comment_params)

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to @article }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end