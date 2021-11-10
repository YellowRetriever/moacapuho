class Item < ApplicationRecord
    belongs_to :provider
    validates :name, :status, :prefecture, :city, :address, :text, :provider_id, presence: true
    enum status:{inStock: 0, few: 1, soldOut: 2}
end
