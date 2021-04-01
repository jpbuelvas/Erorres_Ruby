module Api
    module V1
        class TweetsController < ApiController
            before_action :set_twett, only: [:show, :destroy]
            #Get Api/v1/tweets
            def index
                @tweets = Tweet.all
                render json: @tweets
            end 
            def show
				@tweet = Tweet.find(params[:id])
                render json: @tweet
			end

            def new
                @tweet = Tweet.new
            end
        
            def destroy 
                @tweet = Tweet.find(params[:id]).destroy
            
                message_information = "Elimnado"
                render :json => {"Confirmacion" => message_information}.to_json, :status => :ok

            
            end
        
            def create
                @tweet =Tweet.new(tweet_params)
                @tweet.user_id = current_user.id
                if @tweet.save
                 render json: @tweet, status: 200
                else
                    message_error = "Tweet no pudo ser guardado."
                    @tweet.errors.full_messages.each do |error|
                      message_error = message_error + " & " + error
                    end
                    # render error: { error: message_error, status: 400 }
                    render error: { error: 'No se pudo guardar', status: 400 }
                end
            end
        
            private
            def set_twett
                @tweet = Tweet.find(params[:id])
            end
            def tweet_params
                params.require(:tweet).permit(:description)
            end
        end
  end
end
