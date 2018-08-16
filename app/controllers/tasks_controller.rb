class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
     @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'task が正常に追加されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が追加されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
     @task = Task.find(task_params)

    if @task.update(task_params)
      flash[:success] = 'task が正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(task_params)
    @task.destroy
    
    flash[:success] = 'task が正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end

end
