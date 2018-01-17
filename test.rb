require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key    = 'iaQQeGSADKb84R0xw4HnMbKYW'
  config.consumer_secret = 'ddIwcasZ2lneZECTlvVzSsK7iSLUD4znUYLCOS7kiP3jI54bYK'
  config.access_token    = '2424673471-GECq396dbrYYOUdXw2PYHETsaYB6o5UsAUJl6wx'
  config.access_token_secret = 'IrkhA4WcmQGimXTyzJ2rK2g2iFVo4lUNGw4xBFnajyLvO'
end

# 特定ユーザのtimeline取得
@client.user_timeline("zmuztatsu26 ").each do |timeline|
  puts @client.status(timeline.id).text
end

# 特定ユーザのtimelineを件数(2件)指定して取得
@client.user_timeline("zmuztatsu26 ", { count: 2 } ).each do |timeline|
  puts @client.status(timeline.id).text
end
