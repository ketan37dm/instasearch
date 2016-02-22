require "instagram"

Instagram.configure do |config|
  config.client_id = '779b6b3083214041a727a72f56f29d95'
  config.client_secret = '9ce7c579546b4e3cb68327d6656cbe47'
  config.redirect_uri = 'http://9cb3a47b.ngrok.io/welcome/callbacks'
end
