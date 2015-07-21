class Tweet < ActiveRecord::Base


	def self.setup
		configTweet
		configIndico

	end

	def self.twitter
		setup
		@client.sample do |object|
			if object.is_a?(Twitter::Tweet)
				@tweetObject = object.text
				if Indico.language(@tweetObject, @config)['English'] > 0.07
					@tweetUser = object.user.id.to_s

					break
				end
			end
		end
		response = HTTParty.get("https://twitter.com/intent/user?user_id=#{@tweetUser}")
		dom = Nokogiri::HTML(response.body)
		@tweet = dom.xpath("//*[@id='bd']/div[2]/div[1]/div[2]/div[2]/div").text
		@tweeter = dom.xpath("//*[@id='bd']/div[2]/div[1]/div[2]/div[1]/span/span").text

		return [@tweet, @tweeter]
	end


	def self.configTweet
		@client = Twitter::Streaming::Client.new do |config|
			config.consumer_key        = "dMbxE2fLs4eTy00KjsdKrZUN5"
			config.consumer_secret     = "DVvlt8VPtyjmgMoeGPt1yB8R50JNDvSSnjMk1ZrO5mEjbqRMuy"
			config.access_token        = "3268181360-ZGVBIoBHwdLWWnye9s1xoPLdpRQGOyWPqXf7r1Q"
			config.access_token_secret = "sBtuKb5sRHgt0ISfbjOzpOU1VsN76QgqGKgCSoxzgbloR"
		end
	end

	def self.configIndico
		@config = {api_key: "f7c390ae571e2ec89822e13aae49223e"}
	end

end
