class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tweets = Tweet.all
    end 

    def show
        @tweet = Tweet.find(params[:id])
    end

    def new
        @tweet = Tweet.new
    end

    def destroy 
        @tweet = Tweet.find(params[:id])
        if   @tweet.destroy
            redirect_to tweets_path, notice: "Eliminado!"  
        end
    end

    def create
        @tweet =Tweet.new(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            redirect_to tweets_path, notice: "Enviado!"
        else
            flash.alert = "Verifica que hayas escrito algo o que tenga menos de 80 caracteres tu tweet."
            render :new
        end
    end

      
      


    private

    def tweet_params
        params.require(:tweet).permit(:description)
    end

end
