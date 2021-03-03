class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  validates :email, presence:true
  validates :password, presence:true
  has_many :tweets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
        
end
