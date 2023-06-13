class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: [:show]

  def index
    credit_card = CreditCard.find(params[:credit_card_id])
    raise
    @operations = Operation.where(credit_card: credit_card)
  end

  # def create
  #   @operation = Operation.new(transaction_params)
  #   @operation.user_id = current_user.id

  #   if @operation.save
  #     redirect_to operation_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def show
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:operation_amount, :operation_origin, :operation_ceil, :roundup_amount)
  end
end
