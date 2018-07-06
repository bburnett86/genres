class SelectionsController < ApplicationController

  def create
    @selection = Selection.find_or_create_by(user_id: current_user.id, genre_id: params[:genre_id])
    @genre = Genre.find(params[:genre_id])
    if @selection.save
      redirect_to root_url, notice: "Your selection of #{@genre.name} has been saved"
    else
      redirect_to root_url, notice: "There has been an error saving your selections."
    end
  end 

  def destroy
    @selection = Selection.find(params[:id])
    if @selection
      @selection.destroy
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
end
