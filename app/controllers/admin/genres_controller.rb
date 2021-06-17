class Admin::GenresController < ApplicationController
  def new
    @genre = genre.new(genre_params)
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to new_admin_geanres_path
    #本来javaを使うのでredirectは無し
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update
    redirect_to new_admin_geanres_path
  end

private
def genre_params
  params.require(:genre).permit(:name)
end

end
