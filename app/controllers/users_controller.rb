class UsersController < ApplicationController

    get '/register' do
        erb :'users/new.html'
    end 

    post '/users' do
        raise params.inspect
    end
end  