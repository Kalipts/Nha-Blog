class CommentsController < ApplicationController
    def create 
        @article = Article.find(params[:article_id])       
        @comment = @article.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.article_id = @article.id
        if @comment.save 
            redirect_to @article
        else
            redirect_to  @article, notice: "did not comment!"
        end
    end

    def destroy 
    end
    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
