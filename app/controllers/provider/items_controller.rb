class Provider::ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def new
        @item = Item.new
    end
    
    def create
        provider_item_params = params.require(:item).permit(:name, :status, :prefecture, :city, :address, :text, )
    end
end