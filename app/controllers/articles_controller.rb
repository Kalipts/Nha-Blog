class ArticlesController < ApplicationController

    def index
        if params[:tag]
            sql = "
                select * from articles 
                inner join taggings t on articles.id = t.article_id 
                inner join tags t2 on t.tag_id = t2.id
                where t2.name = '#{params[:tag]}'
            "
            @articles = Article.find_by_sql(sql)
        else
            @articles = Article.all     
        end
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
        @comments = Comment.where("article_id=?",params[:id])
        session[:article] = @article.id
     

    end

    private
        def article_params
            params.require(:article).permit(:title, :slug, :subtitle, :body, :all_tags)
        end
end
