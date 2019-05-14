class TasksController < ApplicationController
  # before_action :get_task, except: [:index, :create, :new]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new  # We'll see that in a moment.
  end

  def create
    @task = Task.new(task_params)
    @task.save

    # or restaurant = Restaurant.create(restaurant_params)

    # redirect_to restaurant_path(restaurant.id)
    redirect_to @task # We'll see that in a moment.
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end
end

