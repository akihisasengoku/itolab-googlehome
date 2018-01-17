module Sns::Twitter extend self
  require "google/googlehome"

  def test
    @client = config
    @username = ENV['TWITTER_GET_USER_NAME']
    @post_ip = ENV['GOOGLE_END_POINT']

    # 特定ユーザのtimelineを件数(1件)指定して取得
    @client.user_timeline(@username, { count: 1 } ).each do |timeline|
      text = @client.status(timeline.id).text
      puts "#{text} #{Time.now}"
      if last_tweet = Tweet.all.last
        if text != last_tweet.body
          post_to_googlehome(text, @post_ip)
        end
      else
        post_to_googlehome(text, @post_ip)
      end
    end
  end

  private
    def config
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end

    def post_to_googlehome(text, ip)
      message = Message.create(body: text, room_id: 1)
      Tweet.create(body: text)
      Google::Googlehome.post(text, ip)
      Google::Googlehome.post(text, ip)
    end

end


