Rails.application.routes.draw do

  devise_for :admins, controllers: {
      sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
  }


  root 'public/homes#top'

  scope module: :public do


    resources :games, only: [:index, :show]

    get 'users/confirm' => "users#confirm"
    get 'users/withdrawal' => "users#withdrawal"
    get 'users/withdrawn' => "users#withdrawn"
    resources :users, only: [:show, :edit, :update]

    get 'posts/deleted' => "posts#deleted"
    resources :posts, only: [:create, :show, :update]

    resources :comments, only: [:create, :update]

    resources :relationships, only: [:create, :destroy]

    resources :follow_games, only: [:create, :destroy]

    get 'search' => "searches#search"

  end

  namespace :admin do

    resources :games, only: [:index, :new, :create, :show, :edit, :update]

    resources :game_links, only: [:show, :create, :edit, :update, :destroy]

    resources :users, only: [:index, :show, :update]

    resources :posts, only: [:show, :update]

    resources :comments, only: [:update]

    get 'search' => "searches#search"

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
