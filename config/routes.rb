Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  root to: 'tests#index'

  devise_for :users,
             path: :gurus,
             path_names: {sign_in: :login, sign_out: :logout},
             controllers: {
                 registrations: "users/registrations",
                 sessions: "users/sessions",
                 passwords: "users/passwords",
                 confirmations: "users/confirmations",
             }

  resource :feedback, only: %i[show create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
      get :time, to: 'test_passages#time'
      post :time_up, to: 'test_passages#time_up'
      post :last_time, to: 'test_passages#last_time'
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    get :gists, to: 'gists#index'
  end
end
