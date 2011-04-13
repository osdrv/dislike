require 'rubygems'
BUNDLE_GEMFILE = File.expand_path(settings.root + "/Gemfile")
require 'bundler/setup'
require 'pathname'
require 'mongoid'
Bundler.require(:all)

$:.unshift(settings.lib)
Mongoid.load!(File.join(settings.config, 'mongoid.yml'))
Dir[settings.lib + '/model/*.rb'].each { |file| require file }
