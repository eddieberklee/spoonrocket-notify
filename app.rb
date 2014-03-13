require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

configure do
	Compass.configuration do |config|
		config.project_path = File.dirname(__FILE__)
		config.sass_dir = 'public/css'
	end
	set :haml, { :format => :html5 }
	set :sass, Compass.sass_engine_options
	set :scss, Compass.sass_engine_options
end

get '/' do
  haml :index
end

get '/css/:name.sass.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"../public/css/#{params[:name]}", Compass.sass_engine_options )
end