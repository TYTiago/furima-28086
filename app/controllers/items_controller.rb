
class ItemsController < ApplicationController

rescue => exception
  
end
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

 def create
    @item = Item.new
   if @item.save
    redirect_to @item
    else
    render :new
  end

  def update
    item = Iweet.find(params[:id])
    item.update(item_params)
  end
  
  def destroy
    
  end
  private
end

