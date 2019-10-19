class FeaturedController < ApplicationController
  def index
    @works = Work.all
    @user = User.find(session[:user_id]) rescue nil
    
    @featured_work = Work.featured
  end
end
