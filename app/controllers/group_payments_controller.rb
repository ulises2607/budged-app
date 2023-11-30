class GroupPaymentsController < ApplicationController

    def index
        @group = Group.find(params[:group_id])
        
    end

    def new
        @group = Group.find(params[:group_id])
        @payment = Payment.new
    end

    def create
        @payment = Payment.new(payment_params)
        @payment.group = @group
      
        if @payment.save
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
