class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create

    @order = Order.new
    @book = Book.find(params[:book_id])
    @order.book = @book
    @order.user = current_user
    @order.date = Time.now

    authorize @order

    if @order.save
      redirect_to order_path(@order)
    else
      redirect_to book_path(@book)
    end
  end

end
