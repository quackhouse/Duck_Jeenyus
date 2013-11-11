Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  twitter_key = YOUR_TWITTER_KEY
  twitter_secret = YOUR_TWITTER_SECRET
  provider :twitter, twitter_key, twitter_secret
end
