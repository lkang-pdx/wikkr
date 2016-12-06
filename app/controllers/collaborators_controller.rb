class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new(collaborator_params)
    @wiki = Wiki.find_by(id: params[:collaborator][:wiki_id])

    if @collaborator.save
      flash[:notice] = "Collaborator has been saved."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error saving the collaborator. Please try again."
      render :show
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator has been removed."
      redirect_to @collaborator.wiki
    else
      flash.now[:alert] = "There as an error removing the collaborator."
      redirect_to @collaborator.wiki
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
