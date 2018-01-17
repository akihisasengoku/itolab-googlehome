namespace :sns do
	desc "twitterから情報を取得"
  	task twitter: :environment do
    	Sns::Twitter.test
  	end
end
