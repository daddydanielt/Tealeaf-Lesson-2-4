 class PostsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :set_posts, only: [:show, :edit, :update, :vote]
  

  # set up instance variable for action
  # redirect base on some condition

  def index
    #@posts = Post.all
    @posts = Post.all.sort_by{ |p| p.total_votes }.reverse #descending sorting
    
  end

  def show    
    #binding.pry

  end

  def new

    @post = Post.new    
    
  end
  
  def create    
         
    # strong paramerters
    # so I have to do that.
    mass_assignment_attributes = post_params
    @post = Post.new(mass_assignment_attributes)
    
    #@post.creator = User.first #TODO: change once we have authentication
    @post.creator = current_user

    #binding.pry

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path      
    else      
      #render 'new'  
      binding.pry
      render :new
    end
    
  end
  
  def edit
    #@post = Post.find(params[:id]) 
  end
  
  def update
    #binding.pry
    #@post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "The post was updated."
      #redirect_to posts_path   
      redirect_to post_path(@post.id)   
    else
      #render 'edit'
      render :edit
    end
  end

  def vote    
    #hard_code: user_id, you should use session information for current_login_user
    
    #@vote = Vote.new(vote:params[:vote], user_id: current_user.id, voteable:@post)    
    #if @vote.save
    #if !@vote.errors.any?      

    @vote = Vote.create(vote:params[:vote], user_id: current_user.id, voteable:@post)      
    
    if @vote.valid?
      flash[:notice] = "Vote <strong>success!</strong> ".html_safe     
    else
          
      flash[:notice] = "You can only vote on this post once."      
    end

    redirect_to :back
  end 

  private
  def post_params
    # allow all attributes
    # ex: params.require(:post).permit(:title, :url, :description)
    
    #------------>
    # TODO: Tetsing the following scenario
    #params.require(:post).permit!
    #params.require(:post).permit(:title, :url, :description, :category_ids)
    params.require(:post).permit(:title, :url, :description, category_ids:[])
    #------------>

    #if user.admin?
    #  params.require(:post).permit!
    #else      
    #  params.require(:post).permit(:title,:url)
    #end
  end

  def set_posts
    @post = Post.find(params[:id])        
    #@comment = Comment.new(post:@post)
    @comment = Comment.new
  end   
  
end
