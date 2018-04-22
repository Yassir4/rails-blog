class ArticlesController < ApplicationController

    def new
    end
    
    def show
        @article = Article.find(params[:id])
        @writer = Writer.find(@article.writer_id)
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
        article = Article.find(params[:id])
        article.destroy
        flash[:success] = "article deleted"
        redirect_to current_writer
    end
        
    private
    
    def article_params
        params.require(:article).permit(:title, :body)
    end


end
