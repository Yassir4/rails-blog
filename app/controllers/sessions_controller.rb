class SessionsController < ApplicationController
    

  def new
    
  end

  def create   
    writer = Writer.find_by_email(params[:session][:email].downcase)
      if writer && writer.authenticate(params[:session][:password])  
        # update the remember token in the cookies and in the DB 
        if params[:session][:remember_me] == '1'
          remember(writer)   
        end
        session[:writer_id] = writer.id       
        redirect_to current_writer 
      else
        flash.now[:danger] = "Password or Email was incorrect"
        render :new
      end   
  end

  def destroy
    session[:writer_id] = nil
    cookies.delete :remember_token
    redirect_to login_path
  end


  private


end
