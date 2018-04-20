module SessionsHelper
    

    # this methode is used in the view 
    # to check if the user is logged_in 
    def logged_in?
        !current_writer.nil? 
    end

    # used in the writers_contoller
    # to prevent unlogged_in users from accessing 
    # to the writers profiles and articles
    def logged_in_writer?
        if current_writer
            true
        else
            flash[:warning] = "Please login first"
            redirect_to login_path
        end
    end
    
    #this method is used to DRY the need of assign in 
    #the writer every time we need an info ex (current_user.id)
    def current_writer
        @writer ||= Writer.find_by(id: session[:writer_id])              
    end
    
    # used in the writers_controller to prevent  writers 
    # from editing another writer info
    def current_writer?(writer)     
        writer == current_writer
    end

    #logged in the user with the cookies  used as a before action
    def logged_in_writer     
        if cookies[:remember_token]
           remember_token = Writer.encrypt(cookies[:remember_token])
           writer = Writer.find_by(remember_token: remember_token )
           session[:writer_id] = writer.id
        end
    end

    #used to remember the writer if checked the remember_me box
    # in the login form
    def remember(writer)
        remember_token = Writer.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        writer.update_attribute(:remember_token, Writer.encrypt(remember_token))
    end
    
    def logout_writer
        session[:writer_id] = nil
        cookies.delete :remember_token
        redirect_to login_path
    end
end
