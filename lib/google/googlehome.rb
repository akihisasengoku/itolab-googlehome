module Google::Googlehome extend self

  def post(message_text, ip)
    begin
      conn = Faraday::Connection.new(:url => ENV['GOOGLE_END_POINT']) do |builder|
        builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
        builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
        builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
      end

      conn.post '/google-home-notifier' # POST "color=black" to http://example.com/api/nyan.json
      conn.post do |req|
        req.url '/google-home-notifier'
        req.body = {
          text: message_text,
          ip: ip
        }
      end
    rescue => e
      # エラー時の処理
      puts e
    end
  end
end