class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newpost = Post.new
  end

  def profile
    #grab username from the URL as :id
    if User.find_by_username(params[:id])
      @username = params[:id]
    else
      redirect_to root_path, :notice=>"User not found!"
    end
    
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newpost = Post.new
    
    @toFollow = User.all.last(5)
  end

  def explore
    @toFollow = User.all.last(5)
    @posts = Post.all
    @newpost = Post.new
  end
end
