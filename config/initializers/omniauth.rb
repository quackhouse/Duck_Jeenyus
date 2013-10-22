Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  twitter_key = "AMSqVp2JcQfNpFRiyUCwNg"
  twitter_secret = "LvVq8C77QqtuL3dvAmb9REtqPsK4SUnzhNKUEgP4oM"
  provider :twitter, twitter_key, twitter_secret
end