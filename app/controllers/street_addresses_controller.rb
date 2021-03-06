class StreetAddressesController < ApplicationController
  before_action :authenticate_user!, {only: [:create]}
  before_action :sold_out_item, {only: [:index]}
  before_action :street_item, only: [:index, :create, :sold_out_item]
  
  
    def index
      @order = Order.new
      if @item.user_id == current_user.id
        flash[:notice] = "権限がありません"
        redirect_to root_path
      end
    end
  
    def create
      @order = Order.new(order_params)
     if @order.valid?
        pay_item
        @order.save
        redirect_to root_path
      else
        render :index
    end
  end
    private
  
    def order_params
        params.require(:order).permit(:postal, :prefecture_id, :municipality, :address, :phone_number, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
      Payjp::Charge.create(
       amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'                
      )
    end

    def sold_out_item
      @item = Item.find(params[:item_id])
      redirect_to root_path if @item.purchase_record.present?
     end

     def street_item
      @item = Item.find(params[:item_id])
    end

end

