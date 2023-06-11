class PaymentController < ApplicationController
  before_action :find_user
  before_action :find_group
  before_action :find_group_payments
  before_action :find_payment, only: %i[show edit update destroy]

  def index; end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = @user.id
    @payment.group_id = @group.id
    if @payment.save
      redirect_to group_path(id: params[:group_id]), notice: 'Payment created successfully'
    else
      flash.now[:alert] = @payment.errors.full_messages.first if @payment.errors.any?
      render :new, status: 400
    end
  end

  def destroy; end

  private

  def find_user
    @user = current_user
  end

  def find_group
    @group = Group.find(params[:group_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Group not found!'
    redirect_to not_found_index_path
  end

  def find_group_payments
    @group_payments = Payment.where({ group_id: params[:group_id] }).order(name: :asc)
  end

  def find_payment
    @expense = Expense.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Payment not found!'
  end

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
