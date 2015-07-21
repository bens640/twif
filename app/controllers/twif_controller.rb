class TwifController < ApplicationController
	def index
		setup
	end

	def new
		setup
		redirect_to :back
	end



	def setup
		@twif = Twiff.new
		@twiff = Tweet.twitter
		@user = @twiff[1]
		@tweet = @twiff[0]

		@twif.gif = Gif.giphy(@tweet)

	end
end