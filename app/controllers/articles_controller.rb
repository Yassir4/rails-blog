class ArticlesController < ApplicationController

    before_action :correct_writer, only: [:edit, :update, :destroy]

    def new
    end
    
    def edit
        @article = Article.find(params[:id])
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
        
    def update 
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
            flash[:success]= "Article updated"
            redirect_to @article
        else
            render :edit
        end
    end

    private
    
    def article_params
        params.require(:article).permit(:title, :body)
    end

    def correct_writer
        article = Article.find(params[:id])
        if !current_writer?(article.writer)
            redirect_to current_writer
        end
    end

end