class Product < ApplicationRecord
    belongs_to :user
    has_many :lineitems

    def sum
       @order = current_user.products
       @products= @lineitem.price*@lineitem.quantity
    end
end
