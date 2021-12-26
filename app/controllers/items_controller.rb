class ItemsController < ApplicationController
    before_action :set_q, only: [:index, :search]
    
    def index
        @items = Item.all
    end
    
    def search
         @results = @q.result(distinct: true)
    end
    
    def show
        @item = Item.find(params[:id])
        @item.show_count += 1
        @item.save
    end
    
    
    def new
        @item = Item.new
    end
    
    private
    def set_q
        @q = Item.ransack(params[:q])
    end
end