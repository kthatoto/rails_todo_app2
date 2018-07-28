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
      render json: {task: task.json}, status: 201
    else
      render json: {error: :create_failed}, status: 400
    end
  end
  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      if params[:assigneeIds]
        task.assignments.where.not(user_id: params[:assigneeIds]).destroy_all
        params[:assigneeIds].each do |assignee_id|
          User.find(assignee_id)
          Assignment.find_or_create_by(task_id: task.id, user_id: assignee_id)
        end
      end
      if params[:labels]
        TaskLabel.joins(:label, :task)
          .where(tasks: {id: task.id})
          .where.not(labels: {name: params[:labels]})
          .destroy_all
        params[:labels].each do |label_name|
          label = Label.find_or_create_by(name: label_name)
          TaskLabel.find_or_create_by(task_id: task.id, label_id: label.id)
        end
      end
      render json: {task: task.json}, status: 200
    else
      render json: {error: :update_failed}, status: 400
    end
  end
  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: nil, status: 204
  end
  private
    def task_params
      params.permit(:content, :status)
    end
end
