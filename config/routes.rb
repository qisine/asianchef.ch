AsiachefCh::Application.routes.draw do
  devise_for :users
  devise_for :chefs

  root :to => 'home#index'
end
