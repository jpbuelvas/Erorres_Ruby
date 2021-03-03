class Tweet < ApplicationRecord
#validaciones
 validates :description, presence:true
 validates :description, length: {maximum: 80}

 belongs_to :user
end
