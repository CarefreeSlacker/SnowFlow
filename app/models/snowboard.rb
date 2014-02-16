class Snowboard < ActiveRecord::Base
  #one of goods

  #propereties
  has_one :item , as: :good
  belongs_to :category

  #callbacks
  before_save { self.category_id = 1 }
  after_save do
    unless Item.where(good: self).first
      item = Item.new
      item.good = self
      item.save
    end
  end
  before_create {self.category_id = 1}
  after_create do
    item = Item.new
    item.good = self
    item.save
  end


  #validatons
  validates :manufacturer, presence: true, length: {maximum: 25}
  validates :name, presence: true, length: {maximum: 25}
  validates :length, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 230 }
  validates :deflection, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 , less_than_of_equal: 10}
  validates :form, presence: true, inclusion:
      { in: %w(Directional Twin_Tip  Swallow_tail All_mountan),
        message: "%{value} should in: Directional ,Twin_Tip , Swallow_tail ,All_mountan"}
  validates :price, presence: true, numericality: {greater_than: 0.0 }
  validates :description, presence: true, length: {maximum: 200}


end
