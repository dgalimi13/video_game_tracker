class GamesController < ApplicationController

delete "/games/:id" do
@game = Game.find_by(id: params[:id])
@game.destroy
redirect to "/consoles/#{ @game.console.id }"
end


end 