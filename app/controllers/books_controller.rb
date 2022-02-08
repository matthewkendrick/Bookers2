class BooksController < ApplicationController
  def new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully"
    else
      @books = Book.all.order(updated_at: :asc)
      render "books/index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@book.user_id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully"
    else
      @books = Book.all
      render "books/edit"
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to book_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :profile_image, :body, :destroy)
  end
end
