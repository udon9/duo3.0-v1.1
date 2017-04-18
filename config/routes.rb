Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :lessons, only: [:index, :destroy, :show]
    post 'lessons/:id/toggle' => 'lessons#toggle'
  end
  resources :sentence_data, only: [:show]
  post '/sentence_data/:id/next_movement' =>'sentence_data#next_movement'
  root to: "lessons#index"
end