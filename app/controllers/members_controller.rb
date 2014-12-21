class MembersController < ApplicationController
  include ClubScoped

  before_action :set_member, except: [:index, :new, :create]

  def index
    @members = @club.members
  end

  def new
    @member = @club.members.new
  end

  def create
    @member = @club.members.new(member_params)

    if @member.save
      redirect_to club_members_url(@club)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to club_members_url(@club)
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to club_members_url(@club)
  end

  private
    def set_member
      @member = @club.members.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:first_name, :last_name)
    end
end
