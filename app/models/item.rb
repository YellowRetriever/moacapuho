class Item < ApplicationRecord
    belongs_to :provider
    validates :name, :status, :prefecture, :city, :address, :text, :provider_id, presence: true
    enum status:{"---": 0, inStock: 1, few: 2, soldOut: 3}
    
    has_many_attached :images
end
