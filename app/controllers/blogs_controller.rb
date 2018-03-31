class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :read_blog, only:[:index, :top]
  before_action :force_top, only:[:new, :edit, :show, :index]
  # GET /blogs
  # GET /blogs.json
  def index
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  # GET /blogs/new
  def new
    if params[:back]
      @blog =Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to @blog, notice: "ブログが作成されました"
    else
      render :new
    end
  end


  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "ブログを編集しました"
      else
      render :edit
    end
  end


  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました"
  end
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new  if @blog.invalid?
  end
  def top
  end

  def force_top
    if current_user.nil?
      redirect_to new_session_path, notice: "ログインしてください"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
    def read_blog
      @blogs = Blog.all
    end
end
