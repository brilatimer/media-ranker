class UsersController < ApplicationController
  def login_form
    @user = User.new
  end
  
  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{username}"
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{username}"
    end
    
    redirect_to root_path
  end
  
  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end
  
  <h2>You are logged in as user <%= @current_user.username %></h2>
  
  <!-- app/views/users/login_form.html.erb -->
  <%= form_with model: @user, url: login_path do |f| %>
    <%= f.label :username %>
    <%= f.text_field :username %>
    
    <%= f.submit "Log In" %>
    <% end %>
  end
  
  
  # need to add logout option
  