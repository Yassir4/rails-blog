class WritersController < ApplicationController
  
  def index
    @writers = Writer.all
  end


  def show
    @writer = Writer.find_by(params[:id])
  end

  def new
    @writer = Writer.new
  end


  def edit
  end


  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      flash[:success] = "Account created successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:name, :email, :password, :password_confirmation)
  end
end
