class ApplicationController < ActionController::Base
  before_action :init_props
  def init_props
    @props = {
      user: current_user
    }
  end
end
