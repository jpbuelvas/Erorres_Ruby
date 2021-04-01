class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable

  validates :email, uniqueness: true
  validates :email, presence:true
  validates :password, presence:true
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tweets
  def self.authenticate(email,user_token)
    where("email = ? AND authentication_token  = ?",email,user_token)
  end
end
