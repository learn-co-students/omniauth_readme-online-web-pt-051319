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
