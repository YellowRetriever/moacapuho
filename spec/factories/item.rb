FactoryBot.define do
    
    factory :item, class: Item do
        sequence(:name){|i| "name#{i}" }
        sequence(:status){|i| i = i % 4 }
        sequence(:prefecture){|i| "pref#{i}" }
        sequence(:city){|i| "city#{i}" }
        sequence(:address){|i| "add#{i}" }
        sequence(:text){|i| "text#{i}" }
        sequence(:show_count){|i| i = rand(1000) }
        association :provider
    end
    
    factory :provider, class: Provider do
        sequence(:name){|i| "name#{i}" }
        sequence(:introduction){|i| "intro#{i}" }
        sequence(:prefecture){|i| "pref#{i}" }
        sequence(:city){|i| "city#{i}" }
        sequence(:address){|i| "add#{i}" }
        sequence(:phone){|i| i = rand(9999999999) }
        sequence(:hp_url){|i| "hp_url#{i}" }
        sequence(:twitter_account){|i| "twi#{i}" }
        sequence(:insta_account){|i| "insta#{i}" }
        sequence(:facebook_account){|i| "facebook#{i}" }
    end
        
end