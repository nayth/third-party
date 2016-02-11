Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tumblr, 'key', 'key'
end
