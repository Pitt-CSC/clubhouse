Rails.application.routes.draw do
  scope ':club_slug', constraints: { club_slug: Club::SLUG_FORMAT } do
    scope as: :club do
      resources :members
    end

    get 'register' => 'members/registrations#new', as: :new_club_registration
    post 'register' => 'members/registrations#create', as: :club_registrations
  end
end
