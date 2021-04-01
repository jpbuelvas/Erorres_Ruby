module Api
    module V1
        class UsersController < ApiController
	
            
             def index
	           user = User.find_by(email: params.require(:email))
               if user.valid_password?(params.require(:password))
                    render json: user, status: :ok
               end

	        end
             def create
               @user = User.create!(email: params[:email],name: params[:name],user_name: params[:user_name],password: params[:password],password_confirmation: params[:password_confirmation])
               if @user.save
                    render json: @user, status: :ok
               else
                    render error: { error: 'No se pudo guardar', status: 400 }
               end
               

             end
            private

         end
    end
end