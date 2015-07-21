class TwifController < ApplicationController

def index
	setup
end

	def new
		setup
		redirect_to :back
	end


private
	def setup
		@twif = Twiff.new
		@twif.gif = Gif.giphy
		@twiff = Tweet.twitter
		@user = @twiff[1]
		@tweet = @twiff[0]
	end
end