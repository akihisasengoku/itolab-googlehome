module Sns::Twitter extend self
  require "google/googlehome"

  def test
    @client = config
    @username = "zmuztatsu26"
    @post_ip = "133.68.108.57"

    # 特定ユーザのtimelineを件数(1件)指定して取得
    @client.user_timeline(@username, { count: 1 } ).each do |timeline|
      text = @client.status(timeline.id).text
      if last_tweet = Tweet.all.last
        puts text
        puts Time.now
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
        config.consumer_key    = 'iaQQeGSADKb84R0xw4HnMbKYW'
        config.consumer_secret = 'ddIwcasZ2lneZECTlvVzSsK7iSLUD4znUYLCOS7kiP3jI54bYK'
        config.access_token    = '2424673471-GECq396dbrYYOUdXw2PYHETsaYB6o5UsAUJl6wx'
        config.access_token_secret = 'IrkhA4WcmQGimXTyzJ2rK2g2iFVo4lUNGw4xBFnajyLvO'
      end
    end

    def post_to_googlehome(text, ip)
      tweet = Tweet.create(body: text)
      Google::Googlehome.post(tweet.body, ip)
    end

end


