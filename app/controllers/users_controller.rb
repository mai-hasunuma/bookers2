class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, {only: [:edit, :update]}

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if current_user.id != @user.id
      render root_path
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success] = "You have updated user successfully."
    else
      render :edit
    end
  end

    private

  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
    redirect_to user_path(current_user)
    end
  end


    def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
