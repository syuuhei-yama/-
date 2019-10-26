class Users::ItemsController < ApplicationController
	def index
        @q = Item.ransack(params[:q])
        @items = @q.result(distinct: true)
        @item = Item.page(params[:page]).per(3)
    end

    def show
        @item = Item.find(params[:id])
    end


    private
    def item_params
        params.require(:item).permit(:name,:area,:range,:elevation,:overview,:address,:image)
    end
end
