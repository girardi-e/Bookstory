class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end


  def create
    @order = Order.new
    @book = Book.find(params[:book_id])
    @order.book = @book
    @order.user = current_user
    @order.date = Time.now
    if @order.save
        redirect_to book_order_path(@book, @order)
    else
        redirect_to book_path(@book)
    end

  end

end
