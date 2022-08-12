class User < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :lineitems
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
 
  def seller?
    role == "seller"
  end

  def buyer?
    role == "buyer"
  end
end
