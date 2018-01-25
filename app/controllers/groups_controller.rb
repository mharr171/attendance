class GroupsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_group, only: %i[show edit update destroy]
  before_action :set_members, only: %i[show]

  def index
    @groups = Group.all
  end

  def show
    #
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      flash[:notice] = 'Group was saved.'
      redirect_to user_group_path(current_user, @group)
    else
      flash.now[:alert] = 'There was an error saving the Group. Please try again.'
      render :new
    end
  end

  def edit
    #
  end

  def update
    @group.assign_attributes(group_params)

    if @group.save
      flash[:notice] = 'Group was updated.'
      redirect_to user_group_path(current_user, @group)
    else
      flash.now[:alert] = 'There was an error saving the group. Please try again.'
      render :edit
    end
  end

  def destroy
    if @group.destroy
      flash[:notice] = "\"#{@group.title}\" was deleted successfully."
      redirect_to user_groups_path(current_user)
    else
      flash.now[:alert] = 'There was an error deleting the group.'
      render :show
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def set_members
    @members = @group.members
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
