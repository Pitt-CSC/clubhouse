Rails.application.routes.draw do
  scope ':club_slug', format: Club::SLUG_FORMAT, as: :club do
    resources :members
  end
end
