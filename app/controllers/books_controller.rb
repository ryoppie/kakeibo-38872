class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:year, :month, :day, :inout, :category, :amount)
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: '家計簿が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def events
    @books = Book.all

    events = @books.map do |book|
      {
        title: "#{book.category} - #{book.amount}円",
        start: Date.new(book.year, book.month, book.day),
        url: book_path(book)
      }
    end

    render json: events
  end

  private

  def book_params
    params.require(:book).permit(:year, :month, :day, :inout, :category, :amount)
  end
end
