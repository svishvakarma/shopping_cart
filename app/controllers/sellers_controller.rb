class SellersController < ApplicationController
  def index
    @products=current_user.products   
  end
  
  def new
      @product = Product.new
  end
  
  def create
    @product=current_user.products.new(product_params)
      if @product.save
       redirect_to sellers_path
      else
       render :new, status: :unprocessable_entity
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
     if @product.update(product_params)
      redirect_to sellers_path
     else
      render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    @product = current_user.products.first
    @product.destroy
    redirect_to sellers_path
  end

  def mydash
    @a=Lineitem.joins(:product).where("products.user_id =? ", 1)
    @total_price=0
    @total_quantity=0
    @a.each do |product|
    @total_price=@total_price+(product.price*product.quantity)
    @total_quantity=@total_quantity+product.quantity
    end
  end
    
  private
   def product_params
    params.require(:product).permit(:title, :discription,:price)
   end

end
