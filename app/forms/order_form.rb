class OrderForm
  attr_accessor :order

  def initialize(order, params, shipping)
    shipping_option = shipping.match(/ price /).pre_match
    shipping_price = shipping.match(/ price /).post_match.to_i
    @order = order
    @order.update(shipping_option: shipping_option, shipping_price: shipping_price)
    @order.build_credit_card(params.require(:credit_card).permit!)
  end

  def save
    @order.save
  end

end
