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
        show_count = Item.pluck("show_count").find(params[:id])
        if request.get?
            show_count += 1
        end
    end
    
    def new
        @item = Item.new
    end
    
    private
    def set_q
        @q = Item.ransack(params[:q])
    end
end