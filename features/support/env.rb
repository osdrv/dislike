# encoding: utf-8
require 'rubygems'
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
ENV ||= {}
RACK_ENV ||= 'test'
ENV['RACK_ENV'] ||= RACK_ENV
require 'mongoid'
Mongoid.load!(File.join(File.dirname(__FILE__), '..', '..', 'config', 'mongoid.yml'))
Dir[File.dirname(__FILE__) + '/../../lib/model/*.rb'].each { |file| require file }
