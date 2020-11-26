class ItemsController < ApplicationController
 
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def show
  end

  def create
    Iweet.create(item_params)
  end

  def update
    item = Iweet.find(params[:id])
    item.update(item_params)
  end
  
  def destroy
    
  end
  private
 
end
