class UsersController < ApplicationController
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
      redirect_to(:action => "index")
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
