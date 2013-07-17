class ProjectsController < ApplicationController
  before_filter :confirm_logged_in

  def index
    @projects = User.find(session[:user_id]).projects
  end

  def show
    @project = Project.find(params[:id])
    if @project.users.each do |p|
      if !p.id = session[:user_id]
        return render :text => "htif"
      end
    end
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.users << User.find(session[:user_id])
    if @project.save
      flash[:success] = "Project successfully created!"
      redirect_to(:action => "index")
    else
      flash[:error] = "Error while creating project"
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
