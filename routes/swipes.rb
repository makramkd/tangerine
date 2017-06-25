require 'json'

class Tangerine < Sinatra::Base

  get '/users/:id/swipes' do
    swipes = Swipe.where(swiper_user_id: params['id'])
    if swipes
      swipes = swipes.to_a.map { |swipe| swipe.hashify }
      { swipes: swipes }.to_json
    else
      halt 404, { message: 'no swipes found' }.to_json
    end
  end

  post '/users/:id/swipes' do
    request.body.rewind
    body = JSON.parse(request.body.read)

    swipe = Swipe.create(swiper_user_id: params['id'],
                         swipee_user_id: body['swipee_user_id'].to_i,
                         time_swiped: Time.now.utc,
                         direction: direction_to_i(body['direction']))
    swipe.save
    swiped = Swipe.find_by(swiper_user_id: body['swipee_user_id'],
                           swipee_user_id: params['id'])
    if swiped
      if swiped.direction == Swipe::DIRECTION_RIGHT
        match = 'matched'
      else
        match = 'not_matched'
      end
    else
      match = 'unknown'
    end
    { status: 'success', message: 'swipe created', matched: match }.to_json
  end

  private

  def direction_to_i(direction)
    if direction == 'right'
      Swipe::DIRECTION_RIGHT
    else
      Swipe::DIRECTION_LEFT
    end
  end
end
