class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def edit
    # ログインユーザー以外はeditページに遷移することを禁止
    @book = Book.find(params[:id])

    if @book.user.id != current_user.id
      #redirect_to users_path
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    # 新規投稿機能用
    @book_new = Book.new
    #@user = User.find(current_user.id)
    @user = User.find(@book.user.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  # ストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
