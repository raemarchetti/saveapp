class CreditCardsController < ApplicationController
  # before_action :set_user
  before_action :set_credit_card, only: [:show, :edit, :update, :destroy]

  def index
    @credit_cards = CreditCard.all
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user_id = current_user.id

    if @credit_card.save
      redirect_to credit_cards_path, notice: 'Credit card was successfully linked.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  # If User decide to change an information on the credit card (ex.wrong info)
  def update
    if @credit_card.update(credit_card_params)
      redirect_to credit_card_path, notice: 'Credit card was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @credit_card.destroy
    redirect_to credit_cards_path, notice: 'Credit card was successfully destroyed.'
  end

  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end

  def credit_card_params
    params.require(:credit_card).permit(:card_number, :card_holder_name, :expiration_date, :cvv)
  end
end
