require 'sinatra'
require 'sinatra/activerecord'

require_relative 'lib/init'

class Tangerine < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    'Hello world!'
  end
end

require_relative 'routes/init'
