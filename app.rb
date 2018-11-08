require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/piglatinze' do
    @piglatinize = PigLatinizer.new.latinize(params[:user_phrase])
    erb :piglatin_results
  end

end