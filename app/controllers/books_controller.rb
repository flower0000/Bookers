class BooksController < ApplicationController

  def index
   @books = Book.all
   @book = Book.new
   #Bookモデルを介するための空の入れ物を作成してあげる。これがないとデータの保存ができなくなる．
  end

  def create
   @book = Book.new(book_params)
   if @book.save
   flash[:success] = "successfully"
   redirect_to book_path(@book.id)
   else
   @books = Book.all
   render :index
   end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    flash[:success] = "successfully"
    redirect_to book_path(book.id)
    else
     @book = book
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
