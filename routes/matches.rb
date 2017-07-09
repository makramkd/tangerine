require 'json'

class Tangerine < Sinatra::Base

  # Get the matches for a given user
  get '/users/:id/matches' do
    matches = Match.where(matcher_user_id: params['id'])
    matches = matches.to_a.map { |match| match.hashify }
    { matches: matches }.to_json
  end
end
