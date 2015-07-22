class TwifController < ApplicationController
	before_action :setup, :set_session, :except => [:new_gif, :gif_tag]



	def index

	end


	def new
		redirect_to :index
	end

	def gif_tag
	end

	def new_gif

	end

	def gifs
		render '_gifs', layout: false
	end

	def funny_gifs

		@twif.gif = Gif.funny_gif
		render '_funnygifs', layout: false
	end


	def setup
		@tweetgroup = Tweet.new


		@twif = Twiff.new
		@tweetgroup = @tweetgroup.get_current_tweet
		@user = @tweetgroup[1]
		@tweet = @tweetgroup[0]
		@twif.gif = Gif.new_gif

	end
	private
	def set_session
		if session[:id] == 0
			@tweetgroup.twitter
		end
	end
	end

