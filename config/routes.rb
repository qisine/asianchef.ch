AsiachefCh::Application.routes.draw do
  scope "(:locale)", :locale => /zh|de|en/ do
    scope "d" do
      devise_for :users
      devise_for :chefs
      namespace :public do
        resources :chefs, only: [:index, :show] do
          resources :availabilities
        end
        resources :menus, only: [:index, :show]
      end

      namespace :chefs do
        resources :menus, only: [:create, :update, :destroy]
        resources :messages, only: [:index, :show, :update, :create, :destroy]
        resources :bookings, only: [:index, :show, :update]
      end

      namespace :users do
        resources :bookings, only: [:index, :show, :update]
      end
    end
    resources :home, only: :index
  end

  root :to => 'home#index'
end
