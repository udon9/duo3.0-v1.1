Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :lessons, only: [:index], shallow: true do
      resources :sentence_statuses, only: [:show]
      post 'sentence_statues/:id/ttoggle' => 'sentence_statuses#ttoggle'
      post 'sentence_statues/:id/ftoggle' => 'sentence_statuses#ftoggle'
    end
    post 'lessons/:id/toggle' => 'lessons#toggle'
  end
  resources :sentence_data, only: [:show]
  root to: "lessons#index"
end