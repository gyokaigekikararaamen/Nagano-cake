class Admin::GenresController < ApplicationController
  protect_from_forgery
  before_action :if_not_admin
  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to new_admin_genre_path
    #本来javaを使うのでredirectは無し
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to new_admin_genre_path
  end

private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def if_not_admin
    if customer_signed_in?
      redirect_to admin_session_path
    elsif admin_signed_in?
      redirect_to admin_session_path
    end
  end

end
