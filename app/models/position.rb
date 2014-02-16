class Position < ActiveRecord::Base
  #contains reference to cart good  and its quantity

  #propereties
  belongs_to :cart
  has_one :item


  #functions
  def get_total_price
    self.total_price ||= self.quantity * Item.find(self.item_id).good.price
  end
end
