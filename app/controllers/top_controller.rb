class TopController < ApplicationController
    def index
        @q = Item.ransack(params[:q])
    end
end