class WritersController < ApplicationController
  before_action :logged_in_writer, only: [:show, :index, :edit, :destroy] 



  def index
    @writers = Writer.all
  end


  def show
    writer = Writer.find_by(id: params[:id])
    if current_writer?(writer)
      current_writer
    else
      redirect_to root_path
    end
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
    Writer.find_by(params[:id]).destroy
    render :index
  end
  private

  def writer_params
    params.require(:writer).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
