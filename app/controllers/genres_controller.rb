class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
        render partial: 'partials/show', locals: {genre: @genre}, layout: false
    end
end
