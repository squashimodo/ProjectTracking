class UsersController < ApplicationController
  before_filter :confirm_logged_in, :except => [:create, :new]

  def index
    @users = User.order("users.id ASC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:sucess] = "User created!"
      redirect_to(:controller => :access, :action => :login )
    else
      flash[:error] = "Error while creating user"
      render("new")
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
