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
  
  # let the computer throw randomly
  computer_throw = @throws.sample

  if player_throw == computer_throw then
    "You tied with the computer. Lets try again."
  elsif @defeats[player_throw] == computer_throw then
    "Your throw #{player_throw} beats #{computer_throw}. You won against the computer."
  else
    "Your throw #{player_throw} was beaten by #{computer_throw}. You lost against the computer."
  end
  
end
