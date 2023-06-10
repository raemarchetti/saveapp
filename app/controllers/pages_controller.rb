class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :disable_nav, only: [:home]

  def profile
    @user = current_user
  end

  def disable_nav
    @disable_nav = true
  end
end
