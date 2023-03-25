class IngredientPostsController < ApplicationController

  def index
    @ingredient_posts = IngredientPost.all.includes(:user).order(created_at: :desc)
  end

  def new
    @ingredient_post = IngredientPost.new
  end

  def create
    @ingredient_post = current_user.ingredient_posts.build(ingredient_post_params)

    if @ingredient_post.save
      redirect_to ingredient_posts_path, notice: "具材の投稿が完了しました"
    else
      render :new
    end
  end

  def show
    @ingredient_post = IngredientPost.find(params[:id])
  end

  private

  def ingredient_post_params
      params.require(:ingredient_post).permit(:body, :image)
  end

  def set_board
      @board = current_user.boards.find(params[:id])
  end
end
