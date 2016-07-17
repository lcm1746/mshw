class PostsController < ApplicationController
    before_action :find_post, only: [:create, :show, :edit, :update, :destroy, :upvote, :downvote]
    before_action :authenticate_user!, except: [:index, :show]
    
    def fake
            
    end
    
    def index
        @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
        if @posts.blank?
            @avg_review = 0
        else
            @avg_review = @posts.average(:rating).round(2)
        end
    end
    
    def new
        @post = Post.new
    end 
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end    
    end
    
    def show
        @post = Post.find(params[:id])
        
    end
    
    def edit
       @post = Post.find(params[:id]) 
    end
    
    def update
        @post = Post.find(params[:id])
        
        if @post.update(params[:post].permit(:option, :subject_code, :subject_name, :lecturer, :rating, :content))
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        redirect_to root_path
    end
    
    def upvote 
        @post.upvote_by current_user
        redirect_to :back
    end

    def downvote 
        @post.downvote_by current_user
        redirect_to :back
    end
    
    def find_post
        @post = Post.find(params[:id])
    end
    
    def aa
    end
    
    private
        def post_params
            params.require(:post).permit(:option, :subject_code, :subject_name, :lecturer, :rating, :content)
        end
    
end
