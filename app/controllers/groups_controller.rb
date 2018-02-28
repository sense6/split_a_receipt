class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        @membership = current_user.memberships.build(group_id: @group.id)
        if @membership.save
          @membership.admin!
          format.html { redirect_to @group,
                        notice: 'Group created, you are now admin of this group.'}
        else
          format.html { render :new }
        end
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path
    else
    end
  end

  def show
    @group = Group.find(params[:id])
    authorize! :read, @group
    @admins = User.admins(@group)
    @members = @group.members - @admins
    @posts = @group.posts.order(created_at: :desc)
    @receipts = @group.receipts
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
