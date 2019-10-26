class Admins::ItemsController < ApplicationController
    before_action :authenticate_admin!

	def index
        @q = Item.ransack(params[:q])
        @items = @q.result(distinct: true)
        @item = Item.page(params[:page]).per(3)
    end

    def new
        @item = Item.new
    end

    def show
        @item = Item.find(params[:id])
    end

    def create
         item = Item.new(item_params)
         item.save
         redirect_to items_path
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to item_path(item.id)
    end

    def destroy
        item = Item.find(params[:id]) 
        item.destroy
        redirect_to item_path 
    end


    private
    def item_params
        params.require(:item).permit(:name,:area,:range,:elevation,:overview,:address,:image)
    end
end
