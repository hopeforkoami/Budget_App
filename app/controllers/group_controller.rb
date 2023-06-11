class GroupController < ApplicationController
  before_action :find_user
  before_action :find_group, only: %i[show edit update destroy]
  def index
    @groups = @user.groups.all
  end

  def show
    @payments = @group.payments.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to group_index_path, notice: 'Group created successfully'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :new, status: 400
    end
  end

  def destroy; end

  private

  def find_user
    @user = current_user
  end

  def find_group
    @group = Group.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Group not found!'
    redirect_to not_found_index_path
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
