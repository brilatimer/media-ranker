class VotesController < ApplicationController
  
  def vote_by_work_id 
    @work = Work.find(params[:id])
    @user = User.find(session[:user_id])
    
    Vote.create_vote(@work.id, @user.id)
    redirect_to works_path
  end
end