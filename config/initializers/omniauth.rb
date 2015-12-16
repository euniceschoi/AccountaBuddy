# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
#            :scope => 'email,user_birthday,read_stream', :display => 'popup'
# end

# stuff below works vs above
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id,
  Rails.application.secrets.facebook_app_secret, scope: 'public_profile', info_fields: 'id,name,link'
end
# provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
