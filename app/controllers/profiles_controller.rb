class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
      @user.avatar.attach(params[:user][:avatar]) if @user.avatar.blank?

      if params[:user][:avatar_id]
        @user.avatar.purge
      end

      if @user.update(user_params)
          redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
      else
          flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
          render :edit
      end
  end

  def show; end

  private

  def set_user
      @user = User.find(current_user.id)
  end

  def user_params
      params.require(:user).permit(:email, :name, :avatar, :favorite_ingredient)
  end
end
