class CategoriesController < ApplicationController
  before_action :set_category, only:[:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  def index
    @categories =  Category.all
  end

  def show
    set_category
  end

  def new
    @category = Category.new
  end

  def create
    # Strong parameters
    # according to POST request params data to generate a category object.
    @category = Category.new(category_params)
    
    if @category.save
      flash[:notice] = "Your Category is created"
      #redirect_to posts_path  
      redirect_to root_path  
    else
      render :new
    end

  end

  def edit
    set_category
  end

  def update
    set_category
  end

  private
  def category_params
    #params.require(:category).permit!
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

end