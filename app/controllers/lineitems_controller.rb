class LineitemsController < ApplicationController
    before_action :authenticate_user!
      def index
         @lineitems = current_user.lineitems
      end
      def create
        @user=User.find(current_user.id)
        @order=@user.orders.last
        if @order 
            if @order.cart?
                @lineitem = @user.orders.last.lineitems.new(carts_params)
                @lineitem.user_id = current_user.id
                if @user.orders.last.lineitems.where(product_id: @lineitem.product_id).empty?
                    if @lineitem.save
                        @order = @user.orders.last
                        @order.total_price = @order.total_price + (@lineitem.price*@lineitem.quantity)
                        @order.total_quantity = @order.total_quantity + @lineitem.quantity
                        @order.save
                        redirect_to buyers_path
                    end
                else
                    
                    @lineitems = @user.orders.last.lineitems.where(product_id:  @lineitem.product_id).first
                    @lineitems.quantity =  @lineitems.quantity + @lineitem.quantity
                   
                    @lineitems.save

                    @order = @user.orders.last

                    if  @user.orders.last.lineitems.count > 1
                        @order.total_price = @order.total_price + (@lineitems.price*@lineitems.quantity)
                        @order.total_quantity =  @order.total_quantity + @lineitems.quantity
                        @order.save
                    else
                            
                        @order.total_price = @lineitems.price*@lineitems.quantity
                        @order.total_quantity = @lineitems.quantity
                        @order.save
                    end


                    redirect_to buyers_path
                end 
            else 
               @order = @user.orders.new()
               if @order.save
                 @order.cart!
                 @lineitem = @user.orders.last.lineitems.new(carts_params)
                 @lineitem.user_id = current_user.id
                 if @lineitem.save
                    @order = @user.orders.last

                    @order.total_price = @order.total_price + (@lineitem.price*@lineitem.quantity)
                    @order.total_quantity = @order.total_quantity + @lineitem.quantity
                    @order.save
                    redirect_to buyers_path
                end
               end
            end
        else
            @order = @user.orders.new()
            if @order.save
                @order.cart!
                @lineitem = @user.orders.last.lineitems.new(carts_params)
                @lineitem.user_id = current_user.id
                
                if @lineitem.save
                   
                    @order = @user.orders.last

                    @order.total_price = @order.total_price + (@lineitem.price*@lineitem.quantity)
                    @order.total_quantity = @order.total_quantity + @lineitem.quantity
                    @order.save
                    redirect_to buyers_path
                end
            end
        end
       
      end
      def destroy
        @lineitem = Lineitem.find(params[:id])
        @lineitem.destroy
        redirect_to lineitems_path
      end
      def payment
      end

    def payment_type
      @user=User.find(current_user.id)
      @order=@user.orders.first.lineitems
      @order.update(payment_para)
      if @order.save
          redirect_to buyers_path
      end
    end
      
      private
      def carts_params
       params.permit(:price,:quantity,:product_id)
      end
      def payment_para
        params.permit(:payment_mode)
      end
      
end
  