class BooksController < ApplicationController
  
  # Create
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book Created'
      redirect_to books_path
    else
      render('new')
    end
  end
  
  # Read
  def index
    @books = Book.order('title ASC')
  end

  def show
    @book = Book.find(params[:id])
  end

  # Update
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book Updated'
      redirect_to book_path(@book)
    else
      render('edit')
    end
  end

  # Delete
  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book Destroyed'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end
end
