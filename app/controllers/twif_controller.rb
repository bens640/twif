class TwifController < ApplicationController
	before_action :setup, :except => [:new_gif, :gif_tag, :save]



	def index

	end


	def new
		redirect_to :index
	end

	def gif_tag
	end

	def new_gif
	end

	def save
		@twif.tweet = @twiff
		@twif.save
	end

	def gifs
		render '_gifs', layout: false
	end

	def funny_gifs

		@twif.gif = Gif.funny_gif
		render '_funnygifs', layout: false
	end


	def top_twiffs
		5.times do |x|
			top = "top" + x
			top  = Gif.new_gif
			@array << top
		end
	end

	def setup


		@twif = Twiff.new
		@twiff = Tweet.twitter
		@user = @twiff[1]
		@tweet = @twiff[0]
		@twif.gif = Gif.new_gif

	end
	private

	end

