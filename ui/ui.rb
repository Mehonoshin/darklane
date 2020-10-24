require 'sinatra/base'
require './lib/hosts'
require './lib/gtunnel'

module Ui
  class Web < Sinatra::Application
    OVPN_CONFIG_PATH = '/root/client.ovpn'

    get '/' do
      @hosts = hosts
      erb :index
    end

    post '/hosts/add' do
      hosts.add(params[:ip], params[:b32])
      redirect '/'
    end

    post '/tunnel/start' do
      b32 = hosts.current.b32
      Ui::Gtunnel.new.call(b32)
      redirect '/?tunnel=started'
    end

    get '/ovpn/config' do
      send_file OVPN_CONFIG_PATH, filename: 'darklane.ovpn'
    end

    private

    def hosts
      Ui::Hosts.new
    end
  end
end
