class SessionsController < ApplicationController
    before_action :logout_writer, only: :new 

  def new
    
  end

  def create   
    writer = Writer.find_by_email(params[:session][:email].downcase)
    if writer && writer.authenticate(params[:session][:password]) && active_writer?(writer)
        # update the remember token in the cookies and in the DB
        session[:writer_id] = writer.id
        if params[:session][:remember_me] == '1'
          remember(writer)
        end
      redirect_to current_writer
    else
      flash.now[:danger] = "Password or Email was incorrect"
      render :new
    end
    end

  def destroy
    logout_writer
    redirect_to login_path
  end

  
end
