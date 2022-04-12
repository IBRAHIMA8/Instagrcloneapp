class UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :like]

  def new
    @user = User.new
    puts "new###################################################################"
  end

  def create
     @user = User.new(user_params)
     puts "create###################################################################"
      if @user.save
      #redirect_to user_path(@user.id)
      puts "user save###################################################################"
        redirect_to new_session_path
     else
       puts @user.errors.full_messages

       #render :new
     end
   end

  def show
     @user = User.find(params[:id])
  end


  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def like
    @favorites = User.find(current_user.id).favorites.order(id: "desc")
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :image, :image_cache )
  end

 def correct_user
   user = User.find(params[:id])
   if current_user != user
     redirect_to blogs_path

     end
   end
    def set_user
    @user = User.find(params[:id])
    end

end
