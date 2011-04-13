require 'sinatra'
require File.join(File.dirname(__FILE__), 'config', 'config.rb')
require File.join(File.dirname(__FILE__), 'config', 'boot.rb')

get '/' do
  'ololo'
end