class Item < ApplicationRecord
    validates :name, :status, :prefecture, :city, :address, :text, :provider_id, presence: true
end
