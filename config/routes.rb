require 'api_constraints'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  namespace :api, defaults: {format: :json},
            constraints: {subdomain: /api(?:\.(staging))?/}, path: '/' do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do

      # Potholes routes
      resources :potholes, only: [:index, :create, :show, :score] do
        patch 'score', to: 'potholes#score'
      end

      # Users routes
      resource :users, only: [:create, :show, :report] do
        get 'report', to: 'users#report'
      end
      # get 'report', to: 'users#report'
      # Leaderboard routes
      get 'leaderboard', to: 'leaderboard#show'
    end
  end

end
