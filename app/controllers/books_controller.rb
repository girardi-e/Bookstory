class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    # @books = Book.all
    @books = policy_scope(Book)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    # authorize creation before saving it
    if @book.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to profile_path, notice: 'Book has been successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
    # pundit authorization for model
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :price, :photo)
  end
end
