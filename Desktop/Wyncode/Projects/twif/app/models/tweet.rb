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




end
