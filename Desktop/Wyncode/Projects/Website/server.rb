require 'sinatra'

	get '/' do

		File.read(File.join('public/index.html'))

	end

get '/photo' do

	File.read(File.join('public/photo.html'))


end


get '/about' do

	File.read(File.join('public/about.html'))


end