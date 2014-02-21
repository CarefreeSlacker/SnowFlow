class Headdress < ActiveRecord::Base
  #mounts
  mount_uploader :picture, PictureUploader

  #propereties
  has_one :item, as: :good
  belongs_to :category


  #callbacks
  before_save do
    self.category_id = 2
  end #Category.where(name: 'Headdress').first }
  after_save do
    unless Item.where(good: self).first
      item = Item.new
      item.good = self
      item.save
    end
  end
  before_create {self.category_id = 2 }  #Category.where(name: 'Headdress').first}
  after_create do
    item = Item.new
    item.good = self
    item.save
  end

  #validations
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :warmnes, presence: true,
            numericality: {greater_or_equal_than: 0 , less_or_equal_than: 10, only_integer: true}
  validates :manufacturer, presence: true, length: {maximum: 20}
  validates :matherial, presence: true, length: {maximum: 30}
  validates :collection, presence: true, length: {maximum: 20}
  validates :name, presence: true, length: {maximum: 20}
end
