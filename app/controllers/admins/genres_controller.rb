class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to admins_genres_path
	end
	def update
		@ganre = Genre.find(params[:id])
		@ganre.update(genre_params)
		redirect_to admins_genres_path
	end

private
	def genre_params
	params.require(:genre).permit(:name, :is_actived)
	end

end