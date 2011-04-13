set :root, File.join(File.dirname(__FILE__), '..')
set :lib, File.join(settings.root, 'lib')
set :config, File.join(settings.root, 'config')

ENV ||= {}
RACK_ENV ||= :development
ENV['RACK_ENV'] ||= RACK_ENV
