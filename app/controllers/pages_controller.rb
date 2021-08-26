class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @books = Book.all.first(6)
    @books_rand = Book.all.sample(3)
  end

  def profile
    @user = current_user
    @books = current_user.books
  end

  def bought_books
    @user = current_user
    @orders = Order.all
    @new_array = @orders.select do |order|
      order.user == current_user
    end
  end
end
