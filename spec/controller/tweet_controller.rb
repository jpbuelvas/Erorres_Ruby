require 'rails_helper'
RSpec.describe TweetsController, "#create" do
    describe "Tweet guardado con descripcion invalida" do
      it "no guardar en la base de datos" do
        expect { Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    describe "Tweet con parametros y usuario logeado" do
        let(:user){create(:user)}
        before do
            sign_in(user)
            post :create,params: {
                tweet:{
                    description: "Hola mundo",
                    user_id: user.id
                }
            }
        end
        it "Guardar en la base de datos" do
            expect(Tweet.last.content).to eq("Hola mundo")
        end
        it "Redireccion a tweet_path" do
            expect(subject).to redirect_to(tweets_path)
        end
    end
    describe "Tweet no valido y usuario logeado" do
        let(:user){create(:user)}
        before do
            sign_in(user)
            post :create, params:{
                tweet:{
                    description: "Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,
                    Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo,Hola mundo",
                    user_id: user.id
                }
            }
        end
        it "deberia mandar un mensaje de error" do
           expect(:flash.alert).to eq("Verifica que hayas escrito algo o que tenga menos de 280 caracteres tu tweet.") 
        end
    end

end