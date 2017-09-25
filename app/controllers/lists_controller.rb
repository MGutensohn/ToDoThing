class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [ :edit, :update, :destroy]
  def index
    @lists = List.where(user_id: current_user.id)
    @tasks = Task.all
  end

  def new
    @list = List.new
    @list.tasks.build
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to lists_path, notice: 'list was created successfully!'
    else
      render :new
    end
  end

  def complete
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path, notice: "List updated!"
    else
      render :edits
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List deleted!'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
  def list_params
    params.require(:list).permit(:name_string, :user_id, tasks_attributes: [:id, :list_id, :task_string, :_destroy])
  end
end
