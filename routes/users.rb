require 'json'

class Tangerine < Sinatra::Base

  post '/users' do
    request.body.rewind
    body = JSON.parse(request.body.read)

    user = User.create(firstname: body['firstname'],
                       lastname: body['lastname'],
                       gender: body['gender'],
                       age: body['age'],
                       bio: body['bio'])
    user.save!

    { status: 'success', message: 'user created' }.to_json
  end
  
  get '/users/:id' do
    u = User.find_by_id(params[:id].to_i)
    if !u.nil?
      u.jsonify
    else
      halt 404, { message: 'user not found' }.to_json
    end
  end
end
