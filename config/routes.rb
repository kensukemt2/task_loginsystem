Rails.application.routes.draw do
  get 'favorites/create'

  get 'sessions/new'

  root to: 'blogs#top'
  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :sessions, only:[:new, :create, :destroy ]
  resources :users, only: [ :new, :create, :show, :edit, :update ]
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
