class CommentsController < ApplicationController
  
  before_action :require_user
  

  def new
    @comment = Comment.new
  end

  def create    
    @post = Post.find(params[:post_id])          
    
    #@comment = Comment.new(params.require(:comment).permit(:body))  
    #@comment.post = @post    
    @comment = @post.comments.build(params.require(:comment).permit(:body))  
    #@comment.creator = User.first #TODO: change once we have authentication
    @comment.creator = current_user
    
    if @comment.save      
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)      
    else
      render 'posts/show' 
    end
  end

  def vote
    
    @comment = Comment.find(params[:id])

    #@vote = Vote.create(vote:params[:vote], user_id: current_user.id, voteable:@comment)      
     @vote = Vote.create(vote:params[:vote], creator: current_user, voteable:@comment)      
    
    if @vote.valid?
      flash[:notice] = "Vote <strong>success!</strong> ".html_safe     
    else
      #flash[:notice] = "Vote fail!<br/>".html_safe      
      flash[:error] = "You can only vote on this comment once."
        
    end

    redirect_to :back
  end


end