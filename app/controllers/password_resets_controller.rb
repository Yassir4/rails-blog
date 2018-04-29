class PasswordResetsController < ApplicationController

  before_action :check_expiration, only: [:edit, :update]


  def new
  end

  def create 
    writer= Writer.find_by_email(params[:password_reset][:email].downcase)
    if writer
      writer.send_password_reset
      flash[:success]= "Please check your inbox"
      redirect_to login_path
    else
      flash.now[:danger]= "Email not found"
      render :new
    end
  end

  def edit
    redirect_to root_url unless @writer= Writer.find_by_password_reset_token(params[:id])
  end

  def update 
    writer = Writer.find_by_password_reset_token!(params[:id])
    if writer.update_attributes(password_reset_params)
      flash[:success]= "Password Updated"
      writer.update_columns(password_reset_token: nil)
      login(writer)
    else
      flash[:warning]= "Invalid password"
      redirect_to edit_password_reset_url(params[:id])
    end
  end

  private

    def password_reset_params
      params.require(:writer).permit(:password, :password_confirmation)
    end

    def check_expiration
      time_diff = Time.now - Writer.first.password_reset_sent_at
      if (time_diff / 1.minute).round > 15
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
    
end