class ArticlesController < ApplicationController

    def new
    end
    
    def show
        @article = Article.find params[:id]
    end

    def create
        @article = Article.new(article_params)
        current_writer.articles << @article
        if @article.valid?
            flash[:success]= "article created"
            redirect_to current_writer
        else
            render :new 
        end
    end

    def destroy
    end
        
    private
    
    def article_params
        params.require(:article).permit(:title, :body)
    end


end
