class SessionsController < ApplicationController


  def new
    
  end

  def create
    writer = Writer.find_by_email(params[:session][:email].downcase)
      if writer && writer.authenticate(params[:session][:password])  
        session[:writer_id] = writer.id   
        redirect_to writer
      else
        flash.now[:danger] = "Password or Email is incorrect"
        render :new
      end   
  end

  def destroy
  end


  # private
  # def writer_params
  #   params.require(:writer).permit(:password, :email)
  # end
end
