require 'sinatra'

before do
  content_type :txt
  @defeats = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeats.keys
end


get '/throw/:type' do
  # play here
end
