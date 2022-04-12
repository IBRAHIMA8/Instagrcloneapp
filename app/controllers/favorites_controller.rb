class FavoritesController < ApplicationController
#before_action :authenticate_user!
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}J'ai inscrit mon blog en favori"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}Ne pas ajouter votre blog aux favoris"
  end
end
