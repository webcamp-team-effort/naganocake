class Admins::GenresController < ApplicationController
before_action :authenticate_admin!
	def index
		@genre = Genre.new
		@genres = Genre.all
	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def create
		@genre = Genre.new(genre_params)
		if @genre.save
		   redirect_to admins_genres_path
		else
		   @genres = Genre.all
		   render "index"
		end
	end
	def update
		@ganre = Genre.find(params[:id])
		if @ganre.update(genre_params)
		   redirect_to admins_genres_path
		else
			@genre = Genre.find(params[:id])
			render "edit"
		end
	end

private
	def genre_params
	params.require(:genre).permit(:name, :is_actived)
	end

end