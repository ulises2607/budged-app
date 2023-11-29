class PaymentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @payments = current_user.payments
    end
    
    def new
        @payment = Payment.new
    end
    
    def create
        @payment = Payment.new(payment_params)
        @payment.user = current_user
        if @payment.save
        redirect_to payments_path
        else
        render :new
        end
    end
    
    private
    
    def payment_params
        params.require(:payment).permit(:name, :amount)
    end

end
