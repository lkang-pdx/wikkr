class UsersController < ApplicationController
  def downgrade
    @user = current_user
    @user.remove_role :premium

    if @user.save
      wikis = @user.wikis
      wikis.update_all(private: false)
      flash[:notice] = "Your membership has been downgraded to standard."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error downgrading the account. Please try again."
      redirect_to edit_user_registration_path
    end
  end
end
