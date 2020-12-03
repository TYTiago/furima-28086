class ItemsController < ApplicationController
  before_action :authenticate_user!, {only: [:new, :edit]}

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

 def create
   @item = Item.new(item_params)
   if @item.save
      redirect_to root_path
    else
      render :new
  end
end

def show
  @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
  if @item.user_id != current_user.id
    flash[:notice] = "権限がありません"
    redirect_to root_path
  end
end

def update
   @item = Item.find(params[:id])
if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

  def destroy
    
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :category_id, :date_delivery_id, :area_id, :status_id, :delivery_id, :image ).merge(user_id: current_user.id)
  end
end
