class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :init_props
  def init_props
    @props = {}
    @props[:user] = current_user
    @props[:users] = User.all.map(&:json)
  end
end
