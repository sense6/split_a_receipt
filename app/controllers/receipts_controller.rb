class ReceiptsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @contributors = @group.members.map {|m| [m.id, m.email]}
    @receipt = Receipt.new
    @currencies = %w[EUR USD PLN]
  end

  def create
    @group = Group.find(params[:group_id])
    @receipt = @group.receipts.build(receipt_params)
    if @receipt.save
      params[:receipt][:contributors].each do |contributor_id|
        @receipt.contributors.build(user_id: contributor_id) unless contributor_id.empty?
      end
      if @receipt.save
        redirect_to @group, notice: 'Receipt with contributors created'
      else
        redirect_to @group, notice: 'Receipt created'
      end
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @group = Group.find(params[:group_id])
    if @receipt.destroy
      redirect_to @group, notice: 'Receipt deleted'
    else
      redirect_to @group, notice: 'Could not delete the receipt'
    end
  end

  private

  def receipt_params
    params.require(:receipt).permit(:name, :currency, :amount)
  end
end
