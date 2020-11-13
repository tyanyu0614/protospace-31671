class PrototypesController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
       @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end
  
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :edit
  end
end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  

end
