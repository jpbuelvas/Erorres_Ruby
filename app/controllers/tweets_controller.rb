class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tweets =Tweet.all
    end 

    def Show
    end

    def new
    end
end
