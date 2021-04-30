FactoryBot.define do
    factory :tweet do
      sequence(:id) { |n| }    
      sequence(:description) { |n| "Tweet and content: #{n}"}      
      created_at { Time.now }
      updated_at { Time.now }
    end
end