class WritersController < ApplicationController
  before_action :logged_in_writer?, 
                    only: [:show, :index, :edit, :destroy] 
  before_action :logout_writer, only: :new 


  def index
    @writers = Writer.all
  end


  def show 
    @writer = Writer.find(params[:id])
    @articles = @writer.articles.order(created_at: :desc)
  end

  def new
  
  end


  def edit
  end


  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      session[:writer_id] = @writer.id
      flash[:success] = "Account created successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    writer =  Writer.find(params[:id])
    writer.destroy
    flash[:success]= "Profile deleted"
    redirect_to writers_url
  end
  private

  def writer_params
    params.require(:writer).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
