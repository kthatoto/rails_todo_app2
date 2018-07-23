class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:user_list]
  # before_action :render_vue

  def tasks_dashboard
    tasks = Task.all.recently_updated.includes(:assignees)
    @props[:todos] = tasks.where(status: :todo).map(&:json)
    @props[:dones] = tasks.where(status: :done).map(&:json)
    render_vue
  end
  def user_list
    render_vue
  end
  private
    def render_vue
      @component_name = params[:action].gsub('_', '-')
      render template: "pages/vue"
    end
end
