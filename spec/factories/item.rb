FactoryBot.define do
    
    factory :item, class: Item do
        sequence(:name){|i| "name#{i}" }
        sequence(:status){|i| i = i % 4 }
        sequence(:prefecture){|i| "pref#{i}" }
        sequence(:city){|i| "city#{i}" }
        sequence(:address){|i| "add#{i}" }
        sequence(:text){|i| "text#{i}" }
        sequence(:show_count){|i| "i = rand(1000)" }
        association :provider
    end
    
end