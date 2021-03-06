class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_staff?
  before_action :find_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.last(20)
  end

  def new
    @order = Order.new
    3.times { @order.skus.build }
    @clients = User.all.where(is_client: true)
  end

  def create
    @order = Order.new order_params
    @order.user = current_user

    if @order.save
      flash[:notice] = 'Order posted successfully'
      redirect_to order_path(@order)
    else
      flash[:alert] = 'Order not created'
      render :new
      # render 'support/orders/show'
    end
  end

  def show
    @order = Order.find params[:id]
    @duedate = @order.created_at + 60.day
    @clients = User.all.where(is_client: true)
    @staff = User.all.where(is_staff: true)
    @grand_total = @order.grand_total
  end

  def update
    @clients = User.all.where(is_client: true)
    @order.assign_attributes(order_params)
    @order.calculate_total

    if @order.save
      flash[:notice] = 'Order updated successfully'
      redirect_to order_path(@order)
    else
      flash[:alert] = 'Order not created'
      render :new
      # render 'support/orders/show'
    end
  end

  private

  def find_order
    @order = Order.find params[:id]
  end

  def order_params
    byebug
    params.require(:order).permit(:user, skus_attributes: [:item, :unit, :amount, :id, :_destroy])
  end

  def user_is_staff?
    unless current_user.is_staff?
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end
end
