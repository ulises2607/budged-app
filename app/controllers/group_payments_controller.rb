class GroupPaymentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @payments = @group.group_payments.includes(:payment).map(&:payment).sort_by(&:created_at).reverse
    @total = @payments.sum(&:amount)
  end
end
