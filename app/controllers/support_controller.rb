class SupportController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_client?
  before_action :find_ticket, only: [:show, :edit, :destroy]

  def index
    @last_ticket = Ticket.last
    @tickets = Ticket.all
    @ticket = Ticket.new
    @ticket.user = current_user
  end

  def show
    @tickets = Ticket.last(20)
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new ticket_params
    @ticket.user = current_user

    if @ticket.save
      flash[:notice] = 'Ticket posted successfully'
      redirect_to support_ticket_path(@ticket)
    else
      flash[:alert] = 'Ticket not created'
      render :new
    end
  end

  def edit
  end

  def destroy
    if can? :destroy, @ticket
      @ticket.destroy
      redirect_to support_tickets_path, notice: 'Ticket Deleted'
    end
  end

  private

  def user_is_client?
    unless current_user.is_client?
      redirect_to root_path, alert: 'Support is only for clients'
    end
  end

  def find_ticket
    @ticket = Ticket.find params[:id]
  end

  def ticket_params
    params.require(:ticket).permit([:title, :body, :department_id, :user])
  end
end
