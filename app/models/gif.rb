class Gif < ActiveRecord::Base

	def self.configIndico
		@config = {api_key: "f7c390ae571e2ec89822e13aae49223e"}
	end

	def self.indico(tweet)
		configIndico
		@tags = Indico.text_tags(tweet, @config)
		@gif_tags =largest_hash(@tags)
		puts '******' * 50
	end


	def self.largest_hash(hash)
		hash.max_by{|k,v| v}
	end

	def self.funny_gif
		response = HTTParty.get("http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC&tag=funny")
		@gif = response['data']['image_url']

	end

	def self.normal_gif

	end

	def self.new_gif
		response = HTTParty.get("http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC")
		@new_gif = response['data']['image_url']
	end

end
