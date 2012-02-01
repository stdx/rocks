require 'sinatra'

before do
  content_type :txt
  @defeats = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeats.keys
end


get '/throw/:type' do
  player_throw = params[:type].to_sym
  
  if !@throws.include?(player_throw) then
    halt 403, "Invalid throw. You must throw one of the following: #{@throws}"
  end
  
end
