class SelectionsController < ApplicationController

  def create
    @selection = Selection.find_or_create_by(user_id: current_user.id, genre_id: params[:genre_id])
    @genre = Genre.find(params[:genre_id])
    @selection.save
  end 

  def destroy
    @selection = Selection.find_by(genre_id: params[:genre_id], user_id: current_user.id)
    if @selection
      @selection.destroy
    end
  end
end
