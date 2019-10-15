class MediasController < ApplicationController
  def index
    @medias = Media.all 
  end
end
