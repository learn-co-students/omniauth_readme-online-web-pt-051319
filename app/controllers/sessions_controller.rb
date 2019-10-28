class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
    	binding.pry
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'welcome/home'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end




# "provider" => "google_oauth2",
# "uid" => "100000000000000000000",
# "info" => {
#   "name" => "John Smith",
#   "email" => "john@example.com",
#   "first_name" => "John",
#   "last_name" => "Smith",
#   "image" => "https://lh4.googleusercontent.com/photo.jpg",
#   "urls" => {
#     "google" => "https://plus.google.com/+JohnSmith"
# }