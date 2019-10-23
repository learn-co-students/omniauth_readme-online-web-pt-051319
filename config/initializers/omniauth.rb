# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
#     {
#         scope: 'userinfo.email, userinfo.profile, http://gdata.youtube.com',
#         prompt: 'select_account',
#         image_aspect_ratio: 'square',
#         image_size: 50
#       }
# end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#     config = Rails.application.config.x.settings["oauth2"]

#     provider :google_oauth2, config["client_id"],
#                              config["client_secret"],
#                              image_size: 150
# end