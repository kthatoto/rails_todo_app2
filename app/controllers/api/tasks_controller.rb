class Api::TasksController < ApplicationController

  def create
    params[:status] = 0
    task = Task.new(task_params)
    if task.save
      params[:assigneeIds].each do |assignee_id|
        Assignment.create!(task_id: task.id, user_id: assignee_id)
      end
      params[:labels].each do |label_name|
        label = Label.find_or_create_by(name: label_name)
        TaskLabel.create!(task_id: task.id, label_id: label.id)
      end
      render json: {task: task}, status: 201
    else
      render json: {error: :create_failed}, status: 400
    end
  end
  private
    def task_params
      params.permit(:content, :status)
    end
end
