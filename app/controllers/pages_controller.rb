class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @books = current_user.books
  end

  def bought_books
    @orders = Order.all
    @new_array = @orders.select do |order|
      order.user == current_user
    end
  end
end
