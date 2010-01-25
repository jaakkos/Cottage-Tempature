require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'pony'
require 'haml'

root_dir = File.dirname(__FILE__)
set :root,        root_dir
set :public,      File.dirname(root_dir) + '/static'
set :views,       File.dirname(root_dir) + '/templates'

use Rack::Session::Cookie, :secret => 'KDF342sdlsdfDSpewroq21334234lsdfsx098zxcdFdsd3422KSDjjsdDfKxq9332434'

load 'models.rb'
load 'cottemp.rb'
