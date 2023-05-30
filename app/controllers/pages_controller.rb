class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @goals = Goal.last(3)
  end

  def profile
    @user = current_user
  end
end
