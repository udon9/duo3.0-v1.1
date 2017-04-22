Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :lessons, only: [:index, :update, :show], shallow: true do
      resources :sentence_statuses, only: [:index, :show]
      get 'sentence_statuses/:id/next' => 'sentence_statuses#next'
      post 'sentence_statuses/:id/ttoggle' => 'sentence_statuses#ttoggle'
      post 'sentence_statuses/:id/ftoggle' => 'sentence_statuses#ftoggle'
    end
    post 'lessons/:id/toggle' => 'lessons#toggle'
    get 'lessons/:id/exercise' => 'lessons#exercise'
    get 'lessons/:id/review' => 'lessons#review'
  end
  resources :sentence_data, only: [:show]
  root to: "lessons#index"
end