class Admins::ItemsController < ApplicationController
	def index
		@items = Item.all
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
        params.require(:item).permit(:name,:area,:range,:elevation,:overview,:image)
    end
end
