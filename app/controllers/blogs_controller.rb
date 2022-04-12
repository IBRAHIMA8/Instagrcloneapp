class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(id: "desc")
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    @blog = Blog.new
  end

  def edit
      if Blog.find(params[:id]).user.name == current_user.name
        @blog = Blog.find(params[:id])
      else
        redirect_to blogs_path
      end
    end

  def create
    @blog = Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params)
    respond_to do |format|
      if @blog.save
        ContactMailer.contact_mail(@blog, current_user).deliver
        format.html { redirect_to blogs_path, notice: "Blog créé avec succès et un mail est envoyé dans votre boîte électronique. Allez en bas de page pour d'autres poste." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
   end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog mise à jour avec succès." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path, notice: "Blog supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
  @blog.user_id = current_user.id
  render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :description, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
