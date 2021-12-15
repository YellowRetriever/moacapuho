FactoryBot.define do
    
    factory :blog, class: Item do
        sequence(:name){|i| "item#{i}" }
        
    end
    
end