require 'rails_helper'
require 'shoulda/matchers'
RSpec.describe Tweet, type: :model do
  describe "Validar el modelo del Tweet" do
    it { should validate_presence_of(:description)}
 end
 describe "Tweet cantidad de caracteres 280" do
   it { should validate_length_of(:description).is_at_most(280)}
 end
 describe "Asociación de usuario con tweet" do 
    it { should belong_to(:user)}
  end
end
