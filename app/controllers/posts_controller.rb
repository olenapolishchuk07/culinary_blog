class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(category: params[:category]) if params[:category].present?
    if params[:search].present?
      q = "%#{params[:search].downcase}%"
      @posts = @posts.where("LOWER(title) LIKE ? OR LOWER(body) LIKE ?", q, q)
    end
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/:id/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "✅ Рецепт успішно опубліковано!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "✅ Зміни збережено!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "🗑️ Запис видалено."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category, :tags)
  end
end
