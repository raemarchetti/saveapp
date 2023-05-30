class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show]

  def index
    @transactions = Transaction.where(user: current_user)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id

    if @transaction.save
      redirect_to transaction_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_amount, :transaction_origin)
  end

end
