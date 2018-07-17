class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_list]

  def tasks_dashboard
    @tasks = [1, 2, 3]
  end

  def user_list
    @users = User.all
  end
end
