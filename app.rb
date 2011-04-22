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
  @base_host = request.host
  @base_host += (request.port == 80) ? '' : ":#{request.port}"
  erb :index
end

get '/plugins/dislike.php' do
  @layout = params['layout']
  @layout ||= 'box_count'
  @app_id = '218626764820932'
  @href = params['href']
  @hash = make_url_hash(@href)
  @count = Dislike.count_for_url(@href)
  @current_url = request.url
  uid = get_fb_user_id_by_cookie(request.cookies["fbs_#{@app_id}"])
  @user_voted = Dislike.user_voted?(uid, @href)
  erb :dislike
end

post '/plugins/dislike.php' do
  check = request.xhr?
  check = check && (make_url_hash(params['href']) == params['hash'])
  @app_id = '218626764820932'
  check = check && check_fb_user(request.cookies["fbs_#{@app_id}"])
  if check
    d = Dislike.new(:fb_uid => params['uid'], :url => params['href'])
    d.save!
  else
    puts (make_url_hash(params['href']) == params['hash']).to_s
    puts check_fb_user(request.cookies["fbs_#{@app_id}"]).to_s
  end
end

delete '/plugins/dislike.php' do
  check = request.xhr?
  check = check && (make_url_hash(params['href']) == params['hash'])
  @app_id = '218626764820932'
  check = check && check_fb_user(request.cookies["fbs_#{@app_id}"])
  if check
    d = Dislike.user_vote(params['uid'], params['href'])
    d.delete if !d.nil?
  end
end
