class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path, success: 'Welcome! You have signed up successfully.'
    else
      render :create
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.order(updated_at: :asc)
    @book = Book.new
  end

  def index
    @users = User.all.order(updated_at: :asc)
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @books = Book.all
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "users/edit"
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to(current_user.id) 
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
