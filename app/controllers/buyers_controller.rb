class BuyersController < ApplicationController
    def index
        @products=Product.all
    end
    
end
