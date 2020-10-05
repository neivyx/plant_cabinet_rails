class SessionsController < ApplicationController

    def welcome

    end


    def destroy
        session.clear
        redirect_to root_path
      end

    def new
        
    end
    
    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          flash[:message] = "Incorrect login info, please try again"
          redirect_to "/login"
        end
      end

      def google 
        @user = User.find_or_create_with_oauth(auth)
        session[:user_id] = @user.id
        #binding.pry
        redirect_to user_path(@user)
      end 
      
      private 

      def auth
        request.env['omniauth.auth']
      end


end