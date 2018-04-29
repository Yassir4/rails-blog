class WritersController < ApplicationController
  before_action :logged_in_writer?, 
                    only: [:show, :index, :edit, :destroy] 
  before_action :logout_writer, only: :new 


  def index
    @writers = Writer.where(active: true).paginate(:page => params[:page], :per_page => 15)
  end


  def show 
    @writer = Writer.find(params[:id])
    @articles = @writer.articles.order(created_at: :desc)
  end

  def new
    @writer= Writer.new
  end


  def edit
  end


  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      @writer.send_confirmation_email
      flash[:info]= "Please confirm your email address to continue"
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
  
  def confirm_email
    writer = Writer.find_by_active_token(params[:token])
    if writer
      writer.update_columns(active: true)
      flash[:success]= "Account created successfully"
      login(writer)
    else
      redirect_to root_path
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
