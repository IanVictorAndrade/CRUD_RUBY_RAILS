class TransfersController < ApplicationController

  def index
    @transfers = Transfer.includes(:from_account, :to_account)
  end

  def new
    @transfer = Transfer.new
    @accounts = Account.all
  end

  def create
    @transfer = Transfer.new(transfer_params)

    Transfer.transaction do
      @transfer.save!
      @transfer.deduct_from_account
      @transfer.deduct_from_account_balance
      @transfer.add_to_account
    end

    redirect_to transfers_path, notice: "Transfer created successfully."
  rescue ActiveRecord::RecordInvalid => e
    @accounts = Account.all
    flash.now[:alert] = "Failed to create transfer -> #{e.message}."
    render :new, status: :unprocessable_entity
  end

  private

  def transfer_params
    params.require(:transfer).permit(:from_account_id, :to_account_id, :amount)
  end

end
