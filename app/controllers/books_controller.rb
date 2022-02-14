class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @new_book = Book.new
  end

  def create
    @user = User.find(current_user.id)
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert: 'Warning!!!'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'You have destroyed book successfully'
      redirect_to books_path
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body, :destroy)
  end

end