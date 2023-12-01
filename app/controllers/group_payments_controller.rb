class GroupPaymentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @payments = GroupPayment.where(group_id: @group.id).map(&:payment).sort_by(&:created_at).reverse
  end
end
