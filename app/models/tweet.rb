class Tweet < ApplicationRecord
#validaciones
 validates :description, presence:true
 validates :description, length: {maximum: 280}
 validates :user_id , presence: true
 belongs_to :user
end
