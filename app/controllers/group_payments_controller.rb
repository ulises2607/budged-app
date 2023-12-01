class GroupPaymentsController < ApplicationController

    def index
        @group = Group.find(params[:group_id])
        @payments = GroupPayment.where(group_id: @group.id).map(&:payment)
    end

end
