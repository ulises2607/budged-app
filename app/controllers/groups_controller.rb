class GroupsController < ApplicationController
  def index
    if user_signed_in?
      @groups = current_user.groups.includes(:payments)
      @total_payments = GroupPayment.joins(:payment, :group).where(groups: { user_id: current_user.id })
      @total_payments = @total_payments.group('groups.id')
      @total_payments = @total_payments.sum('payments.amount')
    else
      @groups = []
      redirect_to new_user_session_path
    end
  end

  def new
    if user_signed_in?
      @group = Group.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @group = Group.new(group_params)
      @group.user = current_user
      if @group.save
        redirect_to groups_path
      else
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
