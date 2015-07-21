class Gif < ActiveRecord::Base



	def self.giphy
		response = HTTParty.get('http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC&tag=funny')
		@gif = response['data']['image_url']
	end
end
