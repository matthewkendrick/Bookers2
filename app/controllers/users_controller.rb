class UsersController < ApplicationController
  def create
    @user = User.new(user_patams)
    if @user.save
      redirect_to user_path, success: 'Welcome! You have signed up successfully.'
    else
      render :create
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @books = Book.all
    if @user.update(user_arams)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to current_user
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
