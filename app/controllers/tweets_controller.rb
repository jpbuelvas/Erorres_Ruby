class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tweets =Tweet.all
    end 

    def Show
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet =Tweet.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice: "Enviado"
        else
            reder :new
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:description)
    end

end
