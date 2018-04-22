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
        if !current_writer
            flash[:warning] = "Please login first"
            redirect_to login_path
        end
    end
    
    #this method is used to DRY the need of assign in 
    #the writer every time we need an info ex (current_user.id)
    def current_writer
        # debugger
        if  !session[:writer_id].nil? 
            @current_writer ||= Writer.find(session[:writer_id]) 
        elsif ( remember_token =  cookies[:remember_token] )
            remember_token = Writer.encrypt(cookies[:remember_token])
            writer = Writer.find_by(remember_token: remember_token )
            if (writer)
                session[:writer_id] = writer.id    
            end        
        end    
    end
    
    # used in the writers_controller to prevent  writers 
    # from editing another writer info
    def current_writer?(writer)     
        current_writer == writer
    end

    #logged in the user with the cookies  used as a before action
    # def logged_in_writer     
    #     if cookies[:remember_token]
    #        remember_token = Writer.encrypt(cookies[:remember_token])
    #        writer = Writer.find_by(remember_token: remember_token )
    #        session[:writer_id] = writer.id
    #     else
    #         logged_in_writer?
    #     end
    # end

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
    end
end
