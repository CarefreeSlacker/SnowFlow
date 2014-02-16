class Item < ActiveRecord::Base

  #this model contains references to all goods

  #propereties
  has_many :positions
  belongs_to :good, polymorphic: true , dependent: :destroy #this option allows it
  belongs_to :category

  #callbacks
  after_save do
    unless self.good.nil?
      self.category_id = self.good.category.id
    end
    p 'category updated'
  end

  after_create do
    unless self.good.nil?
      self.category_id = self.good.category.id
    end
    p 'category updated'
  end

  after_update do
    unless self.good.nil?
      self.category_id = self.good.category.id
    end
    p 'category updated'
  end

  def good=(value)
    self.good_id = value.id
    self.good_type = value.class.to_s
    self.category_id = value.category.id
  end
end
