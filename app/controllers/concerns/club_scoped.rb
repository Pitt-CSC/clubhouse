module ClubScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_club
  end

  private
    def set_club
      @club = Club.find_by_slug!(params[:club_slug])
    end
end
