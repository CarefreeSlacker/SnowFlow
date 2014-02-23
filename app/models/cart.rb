class Cart < ActiveRecord::Base

  #propereties
  belongs_to :user
  has_many :positions, dependent: :destroy
  belongs_to :order


  #finctions
  def get_total_price
    number = 0.0
    self.positions.map{|elem| number += elem.get_total_price }
    self.total_price = number
  end

  def get_total_positions
    self.total_positions = self.positions.count
  end

  def get_total_items
    number = 0
    self.positions.map{|elem| number += elem.quantity }
    self.total_items = number
  end
end
