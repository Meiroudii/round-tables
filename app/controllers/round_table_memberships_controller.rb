class RoundTableMembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_round_table
  def create
    @membership = @round_table.round_table_memberships.build(member: current_user)
    if @membership.save
      redirect_to @membership, notice: "You're now joined this table!"
    else
      redirect_to @membership, alert: "You cannot join this table"
    end
  end
  def destroy
    @membership = @round_table.round_table_memberships.find_by(member: current_user)
    @membership&.destroy

    redirect_to @membership, notice: "You're no longer part of this table."
  end
  private
  def set_round_table
    @round_table = RoundTable.find(params[:round_table_id])
  end
end
