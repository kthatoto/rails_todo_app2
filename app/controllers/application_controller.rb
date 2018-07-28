class ApplicationController < ActionController::Base
  before_action :init_props
  def init_props
    @props = {}
    @props[:user] = current_user
    @props[:users] = User.all.map(&:json)
  end
end
