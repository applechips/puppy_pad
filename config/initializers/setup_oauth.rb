Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
end


# ENV['TWITTER_API_KEY'] = "XvldEmYHhB1oH3evAas7qZxSH"
# ENV['TWITTER_API_SECRET'] = "aRL0Jpz2e0b03abAKbu9S6GYbmpY8WBBt0toHt0eBMVhAi4voS"
