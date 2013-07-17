class TicketsController < ApplicationController
  before_filter :confirm_logged_in
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Tickets.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @ticket.project_id =  params[:project_id]
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.project_id = params[:project_id]
    @ticket.user_id = session[:user_id]
    if @ticket.save
      flash[:success] = "Ticket successfully created!"
      redirect_to(:controller => "projects")
    else
      flash[:error] = "An error occured while trying to create a ticket, please try again"
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
