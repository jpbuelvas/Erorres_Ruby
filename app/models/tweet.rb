class Tweet < ApplicationRecord
#validaciones
 validates :description, presence:true
 validates :description, length: {maximum: 280}
 belongs_to :user
end
