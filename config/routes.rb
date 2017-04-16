Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :lessons, only: [:indexa, :destroy, :show]
    post 'lessons/:id/toggle' => 'lessons#toggle'
  end
  root to: "lessons#index"
end