class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit destroy update]

  def index
    @goals = Goal.where(user: current_user)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_path(@goal), notice: 'Goal created successfully.'
    else
      render :new, status: :unprocessable_entity, notice: 'Failed to create'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, notice: 'Goal updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, notice: 'Goal deleted successfully.'
  end

  private

  def goal_params
    params.require(:goal).permit(:goal_name, :goal_amount)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

end
