class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_list]
  before_action :render_vue

  def tasks_dashboard
  end
  def user_list
  end
  private
    def render_vue
      @component_name = params[:action].gsub('_', '-')
      render template: "pages/vue"
    end
end
