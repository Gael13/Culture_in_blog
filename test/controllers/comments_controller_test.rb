#bundle exec ruby -Itest test/controllers/comments_controller_test.rb

require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @comment = comments(:one)
  end

  test "should get new" do
    get new_article_comment_url(@article)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post article_comments_url(@article), params: { comment: { content: @comment.content } }
    end

    assert_redirected_to article_url(Article.last)
  end
end
