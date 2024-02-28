class BooksController < ApplicationController
  def show
    @book = Book.new
    @users = User.all
    @books = Book.all
  end
  
  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @users = User.all
    @books = Book.all
    @book.user_id = current_user.id
   if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
   else
     render :index
   end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
     redirect_to book_path(@book)
   else
     render :edit
   end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:name, :title, :body, :image)
  end
end
