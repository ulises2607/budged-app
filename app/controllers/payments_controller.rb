class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = current_user.payments
  end

  def new
    @payment = Payment.new
    @group = Group.find(params[:group_id])
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.author = current_user
    @group = Group.find(params[:group_id])
    puts @payment.inspect
    if @payment.save
      @group_payment = GroupPayment.new(group_id: params[:group_id], payment_id: @payment.id)
      @group_payment.save
      redirect_to group_group_payments_path(@group)
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
