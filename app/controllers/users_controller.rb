class UsersController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @users = User.all
    @user = User.new
    @books = Book.all
  end

  def index
    @users = User.all
    @book = Book.new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user.id)
   else
     render :edit
   end
  end
  
  def create
 　 @user = User.new(user_params)
   if @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to book_path
   else
    render :new
   end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :title, :body, :image, :introduction, :post)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
     redirect_to post_images_path
    end
  end
  
end
