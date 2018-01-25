class MembersController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_group
  before_action :set_member, except: %i[new create]

  def show
    #
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.group = @group

    if @member.save
      flash[:notice] = 'Member was saved.'
      redirect_to user_group_path(current_user, @group)
    else
      flash.now[:alert] = 'There was an error saving the member. Please try again.'
      render :new
    end
  end

  def edit
    #
  end

  def update
    @member.assign_attributes(member_params)

    if @member.save
      flash[:notice] = 'Member was updated.'
      redirect_to user_group_member_path(current_user, @group, @member)
    else
      flash.now[:alert] = 'There was an error saving the member. Please try again.'
      render :edit
    end
  end

  def destroy
    if @member.destroy
      flash[:notice] = "\"#{@member.first_name} #{@member.last_name}\" was deleted successfully."
      redirect_to user_group_path(current_user, @group)
    else
      flash.now[:alert] = 'There was an error deleting the member.'
      render :show
    end
  end

  private

  def set_member
    @member = @group.members.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :address, :phone_number, :email)
  end
end
