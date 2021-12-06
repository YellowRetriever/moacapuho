class Provider::ItemsController < ApplicationController
    before_action :authenticate_provider!
    def index
       # @items = Item.where(provider_id: current_provider.id)とも記載できる↓
        @items= current_provider.items
    end
    
    def show
        @item = current_provider.items.find(params[:id])
    end
    
    def new
        @item = Item.new
    end
    
    def create
        provider_item_params = params.require(:item).permit(:name, :status, :prefecture, :city, :address, :text, )
        @item = current_provider.items.new(provider_item_params)
        if @item.save
            redirect_to provider_items_path
        else
            render "new"
        end
    end
    
    def edit
        @item = current_provider.items.find(params[:id])
    end
    
    def update
        provider_item_params = params.require(:item).permit(:name, :status, :prefecture, :city, :address, :text, )
        @item = current_provider.items.find(params[:id])
        if @item.update(provider_item_params)
            redirect_to provider_item_path(@item)
        else
            render "exit"
        end
    end
    
    def destroy
        @item = current_provider.items.find(params[:id])
        @item.destroy
        redirect_to provider_item_path
    end
end