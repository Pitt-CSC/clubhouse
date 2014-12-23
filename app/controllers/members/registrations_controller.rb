class Members::RegistrationsController < ApplicationController
  include ClubScoped

  def new
    @member = @club.members.new
  end

  def create
    @member = @club.members.new(member_params)

    unless @member.save
      render :new
    end
  end

  private
    def member_params
      params.require(:member).permit(:full_name)
    end
end
