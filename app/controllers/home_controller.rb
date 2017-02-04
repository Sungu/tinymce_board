class HomeController < ApplicationController
  def index
    @post = Post.all
  end
  
  def new
  end
  
  def write
    paper = Post.new
    paper.title = params[:title]
    paper.user_id = 1
    paper.content = params[:content]
    paper.save
    
    redirect_to "/home/show/#{paper.id}"
    
     
  end
  
  def show
    @post = Post.find(params[:id])
    if @post.click_num == nil
      @post.click_num = 0
      @post.save
    else
      @post.click_num = @post.click_num + 1
    end
    @post.save
    
  end
  
  def upload_image
    u = Image.new
    u.image = params[:file]
    u.save
    
    render json: { image: { url: u.image.url } }, content_type: 'text/html'
  end
end
