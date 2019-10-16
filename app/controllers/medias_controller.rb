class MediasController < ApplicationController
  def index
    @medias = Media.all 
  end
  
  def show
    @media = Media.find_by(id: params[:id])
    
    if @media.nil?
      head :not_found
      return
    end
  end
  
  def new
    @media = Media.new
  end
  
  def create
    @media = Media.new(media_params)
    
    if @media.save  
      redirect_to media_path(@media.id)  
      return
    else 
      render :new  
      return
    end
  end
  
  def edit
    @media = Media.find_by(id: params[:id])
    
    if @media.nil?
      head :not_found
      return
    end
  end
  
  def update
    @media = Media.find_by(id: params[:id])
    
    if @media.nil?
      head :not_found
      return
    end
    
    if @media.update(media_params)
      redirect_to media_path(@media.id)  
      return
    else  
      render :edit  
      return
    end
  end
  
  def destroy
    @media = Media.find_by(id: params[:id])
    
    if @media.nil?
      head :not_found
      return
    end
    
    @media.destroy
    
    redirect_to medias_path
    return
  end
  
  # private
  
  # def media_params
  #   return params.require(:media).permit(:name, :phone_number)
  # end
end
