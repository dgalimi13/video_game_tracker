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


end