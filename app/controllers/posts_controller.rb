 class PostsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :set_posts, only: [:show, :edit, :update, :vote]
  before_action :require_creator, only: [:edit, :update]


  # set up instance variable for action
  # redirect base on some condition

  def index
    #@posts = Post.all
    @posts = Post.all.sort_by{ |p| p.total_votes }.reverse #descending sorting    

    respond_to do |format|
      format.html
      format.json { render json: @posts } #http://0.0.0.0:3000/posts.json
      format.xml { render xml: @posts } #http://0.0.0.0:3000/posts.xml
    end

  end

  def show    
    #binding.pry

  end

  def new

    @post = Post.new    
    
  end
  
  def create    
         
    # strong paramerters    
    mass_assignment_attributes = post_params
    @post = Post.new(mass_assignment_attributes)        
    @post.creator = current_user
    
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path      
    else      
      #render 'new'        
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
    
    respond_to do |format|
      
      format.html do
        if @vote.valid?    
          flash[:notice] = "Vote <strong>success!</strong> ".html_safe     
        else      
          flash[:notice] = "You can only vote on this post once."      
        end
        redirect_to :back 
      end

      # Default: Rails will try to render the template file naming the same as the aciton. 
      # In this case the tmplate file is vote.js.erbs
      # format.js 

      # Render shared template file
      #format.js  { render "shared/vote", :locals => {:obj => @post, :vote => @vote} }
      #format.js  { render "shared/vote", :locals => {obj: @post, vote: @vote} }
       
      format.js { render 'shared/vote', :locals => { obj: @post, vote: @vote, div_id: method( :display_model_class_name_with_slug ) } }    
    end

    
    
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
    
    #@post = Post.find(params[:id])        
    # Because we overider to_param method, so now the value param[:id] will be the value of slug column.
    @post = Post.find_by(slug: params[:id])        
    
    #@comment = Comment.new(post:@post)
    @comment = Comment.new
  end   
  
  def require_creator    
    access_denied unless logged_in? && ( current_user == @post.creator || current_user.admin?)
  end
end
