class GenresController < ApplicationController

    before_action :check_auth

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
        render partial: 'partials/show', locals: {genre: @genre}, layout: false
    end

    private
    def check_auth
        redirect_to login_path if !logged_in?
    end
end
