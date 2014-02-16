class Order < ActiveRecord::Base

  #propereties
  has_one :cart
  belongs_to :user


  #validations
  validates :post_code, presence: true, format: {with: /\d{6,6}/ } #format validaton doesn't works
  validates :country , presence: true
  validates :region ,presence: true
  validates :lane , presence: true
  validates :city, presence: true


end
