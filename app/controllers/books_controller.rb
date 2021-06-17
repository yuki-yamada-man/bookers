class BooksController < ApplicationController




  def create
    @book=Book.new(book_params)
     @books=Book.all
      if @book.save
        redirect_to  book_path(@book.id),notice:'メッセージが送信されました'
      else
        
        render:index,notice:'メッセージが送信されました'
      end
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @books=Book.all
      if @book.update(book_params)
        redirect_to book_path(@book.id),notice:'メッセージが送信されました'
      else
        flash.now[:alert]='メッセージを入力してください'
        render:index
      end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
