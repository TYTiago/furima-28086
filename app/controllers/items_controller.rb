class ItemsController < ApplicationController
  before_action :authenticate_user!, {only: [:new]}
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

 def create
   @item = Item.new(item_params)
   if @item.save
      redirect_to root_path
    else
      render :new
  end
end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def destroy
    
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :category_id, :date_delivery_id, :area_id, :status_id, :delivery_id, :image ).merge(user_id: current_user.id)
  end
end
