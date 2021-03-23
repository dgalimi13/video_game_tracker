class ConsolesController < ApplicationController
    before '/consoles/*' do
        authentication_required
    end 

    get '/consoles' do
        @consoles = current_user.consoles
        erb :"consoles/index.html"
    end

    get '/consoles/new' do 
        erb :"consoles/new.html"
    end

    get '/consoles/:id' do 
        @console = current_user.consoles.find(params[:id])
        erb :"consoles/show.html"
    end 

    post '/consoles' do 
        @console = Console.new
        @console.name = params[:name]
        @console.user = current_user
        
        if @console.save 
            redirect '/consoles'
        else 
            erb :'consoles/new.html'
        end
    end 

        post 'console/:id/games' do 
            @console = current_user.consoles.find(params[:id])
            @game = @console.games.build(:url => params[:url])
             if @game.save
                redirect "/consoles/#{@playlist.id}"
             else
                erb :"consoles/show.html"
             end
        end

end