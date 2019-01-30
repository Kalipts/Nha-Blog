class ArticlesController < ApplicationController

    def index
        if params[:tag]
            @articles = Article.find_with_tag(params[:tag])
        else
            @articles = Article.all     
        end
    end

    def new
    end

    def edit
        @article = Article.find_by(slug: params[:slug])
    end
    def destroy
        @article = Article.find_by(slug: params[:slug])
        @article.destroy
        
        redirect_to articles_path
        
    end
    def update
        @article = Article.find_by(slug: params[:slug])
        if(@article.update(article_params))
            redirect_to article_path(@article.slug)
        end
        
    end

    def create
        @article = Article.new(article_params)
        @article.save
        redirect_to articles_path(@article.slug)
    end

    def show 
        @article = Article.find_by(slug: params[:slug])
        @comments = Comment.where("article_id=?",params[:slug])
        session[:article] = @article.id
    end

    private
        def article_params
            params.require(:article).permit(:title, :slug, :subtitle, :body, :all_tags)
        end
end
