class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def show
		id = params[:id]
		@movie = Movie.find(id)
	end

	def new
		@movie = Movie.new
		# default: render 'new' template
	end

	def create
		@movie = Movie.create!(movie_params)
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movies_path
	end

	# add below all other methods
	private
	def movie_params
		params.require(:movie).permit(:title, :rating, :description, :release_date)
	end

end
