class ConsolesController < ApplicationController
    before '/consoles/*' do
        authentication_required
    end 

    get '/consoles/new' do 
        erb :"consoles/new.html"
    end

    post 'consoles/' do 
        @console = Console.new
        @console.name = params[:name]
        @playlist.user = current_user
    end 


end