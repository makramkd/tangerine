require 'sinatra'
require 'sinatra/activerecord'

require_relative 'lib/init'

class Tangerine < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  before do
    content_type :json
  end
end

require_relative 'models/init'
require_relative 'routes/init'
