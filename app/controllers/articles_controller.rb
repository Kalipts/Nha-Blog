class ArticlesController < ApplicationController

    def index
        @articles = Article.all
        
    end

    def new
    end

    def edit
        @article = Article.find(params[:id])
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
        
    end
    def update
        @article = Article.find(params[:id])
        if(@article.update(article_params))
            redirect_to @article
        end
        
    end

    def create
        @article = Article.new(article_params)
        @article.save
        redirect_to @article
    end

    def show 
        @article = Article.find(params[:id])
        session[:article] = @article.id
    end

    private
        def article_params
            params.require(:article).permit(:title, :slug, :subtitle, :body)
        end
end
