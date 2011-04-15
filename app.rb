require 'sinatra'
require 'erb'
require File.join(File.dirname(__FILE__), 'config', 'config.rb')
require File.join(File.dirname(__FILE__), 'config', 'boot.rb')

# http://www.facebook.com/plugins/like.php?
  # href=http%3A%2F%2Flocalhost%3A8000
  # &amp;layout=box_count
  # &amp;show_faces=true
  # &amp;width=450
  # &amp;action=like
  # &amp;font
  # &amp;colorscheme=light
  # &amp;height=65

set :erb, :layout_egine => :erb, :layout => :layout

get '/' do
  erb :index
end

get '/plugins/dislike.php' do
  puts params
  @layout = params['layout']
  @layout ||= 'box_count'
  @count = 123
  erb :dislike
end