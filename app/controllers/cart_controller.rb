class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    @weight = total_weight
    if current_order.address
      response = HTTParty.get("http://shipping-rates-client.herokuapp.com/shipments/new?[shipment]name=#{current_order.address.name}&[shipment]city=#{current_order.address.city}&[shipment]state=#{current_order.address.state}&[shipment]postal_code=#{current_order.address.postal_code}&[shipment]weight=#{total_weight}").parsed_response
      @shipping = response.flatten.sort{|a,b| a["total_price"]<=>b["total_price"]}
    end
  end

private
  def total_weight
    current_order.items.inject(0) {|sum, item| sum += (item.product.weight * item.quantity) }
  end
end
