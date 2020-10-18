require 'sinatra/base'
require './lib/hosts'

module Ui
  class Web < Sinatra::Application
    get '/' do
      @hosts = Ui::Hosts.new
      erb :index
    end

    post '/hosts/add' do
      Ui::Hosts.new.add(params[:ip], params[:b32])
      redirect '/'
    end
  end
end
