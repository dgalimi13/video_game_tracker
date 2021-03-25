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

    get "/consoles/:id/edit" do
        @console = current_user.consoles.find(params[:id])
        erb :"consoles/edit.html"
    end

    post '/consoles/:id' do 
        @console = current_user.consoles.find(params[:id])
        erb :"consoles/show.html"
    end 

    
    get '/consoles/:id' do 
        @console = current_user.consoles.find(params[:id])
        erb :"consoles/show.html"
    end 

    

    patch "/consoles/:id" do
        @console = current_user.consoles.find(params[:id])
        @console.update(params[:console])
        redirect to "/consoles/#{ @console.id }"
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

        post '/consoles/:id/games' do 
            @console = current_user.consoles.find(params[:id])
            @game = @console.games.build(:url => params[:url])
             if @game.save
                redirect "/consoles/#{@console.id}"
             else
                erb :"consoles/show.html"
             end
        end

        delete "/consoles/:id" do
            Console.destroy(params[:id])
            redirect to "/consoles"
          end

          delete "/consoles/:id/games" do
            @console = current_user.consoles.find(params[:id])
            @game = @console.games.find(url: params[:url])
            @game.destroy
            redirect to "/consoles/#{@console.id}"
          end

        

end