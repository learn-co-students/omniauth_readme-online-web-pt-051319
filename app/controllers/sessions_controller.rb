class SessionsController < ApplicationController
    def fbauth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
        # binding.pry
        session[:user_id] = @user.id
     
        render 'welcome/home'
    end
    
    #googleauth not functional need refactor and work for project.
    def googleauth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        user = User.from_omniauth(access_token)
        log_in(user)
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        user.save
        redirect_to root_path
      end

    def destroy
        if session[:user_id]
            # reset_session
            session.clear
            redirect_to root_path
        else 
            redirect_to root_path
        end 
    end 
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
end
